//
//  UIViewController+JCPresentQueue.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "UIViewController+JCPresentQueue.h"
#import <objc/runtime.h>

@implementation UIViewController (JCPresentQueue)

+ (void)load {
    SEL oldSel = @selector(viewDidDisappear:);
    SEL newSel = @selector(jc_viewDidDisappear:);
    Method oldMethod = class_getInstanceMethod([self class], oldSel);
    Method newMethod = class_getInstanceMethod([self class], newSel);
    
    BOOL didAddMethod = class_addMethod(self, oldSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (didAddMethod) {
        class_replaceMethod(self, newSel, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

- (void)jc_viewDidDisappear:(BOOL)animated {
    [self jc_viewDidDisappear:animated];
    
    if ([self getDeallocCompletion] && ![self isTemporarilyDismissed]) {
        [self getDeallocCompletion]();
    }
}

- (void)setDeallocCompletion:(void (^)(void))completion {
    objc_setAssociatedObject(self, @selector(getDeallocCompletion), completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))getDeallocCompletion {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDismissCompletion:(void (^)(void))completion {
    objc_setAssociatedObject(self, @selector(getDismissCompletion), completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))getDismissCompletion {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPresentCompletion:(void (^)(void))completion {
    objc_setAssociatedObject(self, @selector(getPresentCompletion), completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))getPresentCompletion {
    return objc_getAssociatedObject(self, _cmd);
}

+ (void)setCurrentPresentType:(JCPresentType)presentType {
    objc_setAssociatedObject(self, @selector(getCurrentPresentType), @(presentType), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (JCPresentType)getCurrentPresentType {
    NSNumber *type = objc_getAssociatedObject(self, _cmd);
    return [type integerValue];
}

- (void)setTemporarilyDismissed:(BOOL)temporarilyDismissed {
    objc_setAssociatedObject(self, @selector(isTemporarilyDismissed), @(temporarilyDismissed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isTemporarilyDismissed {
    NSNumber *num = objc_getAssociatedObject(self, _cmd);
    return [num boolValue];
}

- (void)setDismissing:(BOOL)dismissing {
    objc_setAssociatedObject(self, @selector(isDismissing), @(dismissing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isDismissing {
    NSNumber *num = objc_getAssociatedObject(self, _cmd);
    return [num boolValue];
}

+ (NSMutableArray *)getStackControllers {
    static NSMutableArray *stackControllers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stackControllers = [NSMutableArray array];
    });
    return stackControllers;
}

+ (NSOperationQueue *)getOperationQueue {
    static NSOperationQueue *operationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        operationQueue = [NSOperationQueue new];
    });
    return operationQueue;
}

+ (void)setJc_delegate:(id<JCPresentFallbackDelegate>)jc_delegate {
    objc_setAssociatedObject(self, @selector(jc_delegate), jc_delegate, OBJC_ASSOCIATION_ASSIGN);
}

+ (id<JCPresentFallbackDelegate>)jc_delegate {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark -

- (void)jc_presentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    [self jc_presentViewController:controller presentType:JCPresentTypeLIFO presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
}

- (void)jc_presentViewController:(UIViewController *)controller presentType:(JCPresentType)presentType presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    if ([UIViewController getOperationQueue].operationCount == 0) {
        [UIViewController setCurrentPresentType:JCPresentTypeIdle];
    }
         
    if ([[UIViewController getOperationQueue] operations].count > 0 && presentType != [UIViewController getCurrentPresentType]) {
        [NSException raise:@"This is dangerous." format:@"%@'s present queue is confused. Dont't use LIFO and FIFO two together.", self];
    }
    [UIViewController setCurrentPresentType:presentType];

    if (presentType == JCPresentTypeLIFO) {
        [self lifoPresentViewController:controller presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
    } else {
        [self fifoPresentViewController:controller presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
    }
}

+ (void)jc_cancelAllQueuedOperations {
    NSOperationQueue *queue = [self getOperationQueue];
    [queue cancelAllOperations];
    NSMutableArray *stack = [self getStackControllers];
    [stack removeAllObjects];
}
#pragma mark - present controller with LIFO
- (void)lifoPresentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    // put in stack
    NSMutableArray *stackControllers = [UIViewController getStackControllers];
    if (![stackControllers containsObject:controller]) {
        [stackControllers addObject:controller];
    }
    
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        __weak typeof(controller) weakController = controller;
        [controller setPresentCompletion:presentCompletion];
        [controller setDismissCompletion:dismissCompletion];
        [controller setDeallocCompletion:^{
            if (dismissCompletion) {
                dismissCompletion();
            }
            
            // fetch new next controller if exists, because button action after dismiss completion
            [weakController setDismissing:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakController setDismissing:NO];
                UIViewController *presentTarget = [UIViewController jc_targetPresentingVCForNextPresentationWithReference:weakSelf];
                if (presentTarget) {
                    // if the dismiss controller is the last one
                    if (stackControllers.lastObject == weakController) {
                        [stackControllers removeObject:weakController];
                        
                        // is there any previous controllers
                        if (stackControllers.count > 0) {
                            UIViewController *preController = [stackControllers lastObject];
                            [presentTarget lifoPresentViewController:preController presentCompletion:[preController getPresentCompletion] dismissCompletion:[preController getDismissCompletion]];
                        }
                    } else {
                        NSUInteger index = [stackControllers indexOfObject:weakController];
                        [stackControllers removeObject:weakController];
                        
                        // is there any next controllers
                        NSArray *nextControllers = [stackControllers objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, stackControllers.count - index)]];
                        for (UIViewController *nextController in nextControllers) {
                            [presentTarget lifoPresentViewController:nextController presentCompletion:[nextController getPresentCompletion] dismissCompletion:[nextController getDismissCompletion]];
                        }
                    }
                } else {
                    [UIViewController jc_cancelAllQueuedOperations];
                    [stackControllers removeAllObjects];
                    dispatch_semaphore_signal(semaphore);
                }
            });
        }];
        
        // if the previous controller is dismissing, wait it's completion
        if (stackControllers.count > 1) {
            for (UIViewController *preController in stackControllers) {
                if ([preController isDismissing]) {
                    return ;
                }
            }
        }
        
        // present a new controller before dismissing the presented controller if exists
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *stackControllers = [UIViewController getStackControllers];
            UIViewController *presentedVC = nil;
            for (UIViewController *vc in stackControllers) {
                if (vc.isBeingPresented || vc.presentingViewController) {
                    presentedVC = vc;
                    break;
                }
            }
            
            if (presentedVC) {
                [presentedVC temporarilyDismissViewControllerAnimated:YES completion:^{
                    UIViewController *presentTarget = [UIViewController jc_targetPresentingVCForNextPresentationWithReference:weakSelf];
                    if (presentTarget) {
                        [presentTarget presentViewController:controller animated:YES completion:^{
                            dispatch_semaphore_signal(semaphore);
                        }];
                    } else {
                        [UIViewController jc_cancelAllQueuedOperations];
                        dispatch_semaphore_signal(semaphore);
                    }
                }];
            } else {
                UIViewController *presentTarget = [UIViewController jc_targetPresentingVCForNextPresentationWithReference:weakSelf];
                if (presentTarget) {
                    [presentTarget presentViewController:controller animated:YES completion:^{
                        dispatch_semaphore_signal(semaphore);
                        if (presentCompletion) {
                            presentCompletion();
                        }
                    }];
                } else {
                    [UIViewController jc_cancelAllQueuedOperations];
                    dispatch_semaphore_signal(semaphore);
                }
            }
        });
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }];
    
    // put in queue
    if ([UIViewController getOperationQueue].operations.lastObject) {
        [operation addDependency:[UIViewController getOperationQueue].operations.lastObject];
    }
    [[UIViewController getOperationQueue] addOperation:operation];
}

// dismiss controller temporarily
- (void)temporarilyDismissViewControllerAnimated:(BOOL)flag completion: (void (^ __nullable)(void))completion {
    [self setTemporarilyDismissed:YES];
    [self dismissViewControllerAnimated:flag completion:^{
        [self setTemporarilyDismissed:NO];
        if (completion) {
            completion();
        }
    }];
}

#pragma mark - present controller with FIFO
- (void)fifoPresentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [controller setDeallocCompletion:^{
            if (dismissCompletion) {
                dismissCompletion();
            }
            // got to next operation
            dispatch_semaphore_signal(semaphore);
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController *presentTarget = [UIViewController jc_targetPresentingVCForNextPresentationWithReference:weakSelf];
            if (presentTarget) {
                [presentTarget presentViewController:controller animated:YES completion:presentCompletion];
            } else {
                [UIViewController jc_cancelAllQueuedOperations];
                dispatch_semaphore_signal(semaphore);
            }
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }];

    // put in queue
    if ([UIViewController getOperationQueue].operations.lastObject) {
        [operation addDependency:[UIViewController getOperationQueue].operations.lastObject];
    }
    [[UIViewController getOperationQueue] addOperation:operation];
}

+ (UIViewController *)jc_fallBackPresentingViewController {
    UIViewController * fallbackVC = nil;
    id<JCPresentFallbackDelegate> delegate = [UIViewController jc_delegate];
    if ([delegate respondsToSelector:@selector(jc_fallbackPresentingViewControllerForCachedPresentations)]) {
        fallbackVC = [delegate jc_fallbackPresentingViewControllerForCachedPresentations];
    }
    return fallbackVC;
}

+ (UIViewController *)jc_targetPresentingVCForNextPresentationWithReference:(UIViewController *)referenceVC {
    //  still has warning " Presenting view controllers on detached view controllers is discouraged", not shure how to avoid this
    if ([self isValidPresentTarget:referenceVC]) {
        return [self findTopMostPresentTarget:referenceVC];
    } else {
        return [UIViewController jc_fallBackPresentingViewController];
    }
}

+ (BOOL)isValidPresentTarget:(UIViewController *)target {
    if (target && target.view.window && !target.isBeingDismissed && !target.isMovingFromParentViewController) {
        return YES;
    }
    return NO;
}

+ (UIViewController *)findTopMostPresentTarget:(UIViewController *)target {
    if (target.presentedViewController) {
        if ([self isValidPresentTarget:target.presentedViewController]) {
            return [self findTopMostPresentTarget:target.presentedViewController];
        } else {
            return target;
        }
    } else {
        return target;
    }
   
}

@end


