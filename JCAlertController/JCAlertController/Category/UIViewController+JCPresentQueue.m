//
//  UIViewController+presentQueue.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "UIViewController+JCPresentQueue.h"
#import <objc/runtime.h>
#import "JCAlertController.h"

@implementation UIViewController (JCPresentQueue)

+ (void)initialize {
    if (self == [JCAlertController class]) {
        Method oldMethod = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
        Method newMethod = class_getInstanceMethod([self class], @selector(jc_viewWillDisappear:));
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

// hook方法
- (void)jc_viewWillDisappear:(BOOL)animated {
    [self jc_viewWillDisappear:animated];
    
    if ([self getDismissCompletion]) {
        [self getDismissCompletion]();
    }
}

// 绑定属性
- (void)setDismissCompletion:(void (^)(void))completion {
    objc_setAssociatedObject(self, @selector(getDismissCompletion), completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))getDismissCompletion {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)jc_presentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [controller setDismissCompletion:^{
            // 前往下一个operation
            dispatch_semaphore_signal(semaphore);
            if (dismissCompletion) {
                dismissCompletion();
            }
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:controller animated:YES completion:presentCompletion];
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }];
    
    static NSOperationQueue *operationQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        operationQueue = [NSOperationQueue new];
    });
    if (operationQueue.operations.lastObject) {
        [operation addDependency:operationQueue.operations.lastObject];
    }
    [operationQueue addOperation:operation];
}

@end
