//
//  JCPresentController.m
//  JCPresentController
//
//  Created by HJaycee on 2018/5/3.
//  Copyright © 2018年 HJaycee. All rights reserved.
//

#import "JCPresentController.h"
#import "UIViewController+JCPresentQueue.h"

@interface JCPresentWindow : UIWindow
@end

@implementation JCPresentWindow
@end

@interface JCPresentRootController : UIViewController
@end

@implementation JCPresentRootController
@end

@interface JCPresentQueueManager : NSObject

@property (nonatomic) UIWindow *overlayWindow;
@property (nonatomic) UIWindowLevel overLayWindowLevel;
+ (instancetype)shareManager;

@end

@implementation JCPresentQueueManager

+ (instancetype)shareManager {
    static JCPresentQueueManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [JCPresentQueueManager new];
    });
    return manager;
}

- (UIWindow *)overlayWindow {
    if (!_overlayWindow) {
        JCPresentRootController *rootViewController = [JCPresentRootController new];
        rootViewController.view.backgroundColor = [UIColor clearColor];
        _overlayWindow = [[JCPresentWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _overlayWindow.backgroundColor = [UIColor clearColor];
        _overlayWindow.windowLevel = self.overLayWindowLevel;
        _overlayWindow.rootViewController = rootViewController;
        _overlayWindow.hidden = NO;
        [_overlayWindow makeKeyAndVisible];
    }
    return _overlayWindow;
}

@end

@implementation JCPresentController

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAllControllersDismissed) name:JCPresentControllersAllDismissedNotification object:nil];
}

+ (void)setOverlayWindowLevel:(UIWindowLevel)windowLevel {
    [JCPresentQueueManager shareManager].overLayWindowLevel = windowLevel;
}

+ (void)presentViewControllerLIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
[self presentViewController:viewController presentType:JCPresentTypeLIFO presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
}

+ (void)presentViewControllerFIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    [self presentViewController:viewController presentType:JCPresentTypeFIFO presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
}

+ (void)presentViewController:(UIViewController *)viewController presentType:(JCPresentType)presentType presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    [[JCPresentQueueManager shareManager].overlayWindow.rootViewController jc_presentViewController:viewController presentType:presentType presentCompletion:^{
        if (presentCompletion) {
            presentCompletion();
        }
    } dismissCompletion:^{
        if (dismissCompletion) {
            dismissCompletion();
        }
    }];
}

+ (void)onAllControllersDismissed {
    [JCPresentQueueManager shareManager].overlayWindow.hidden = YES;
    [JCPresentQueueManager shareManager].overlayWindow = nil;
}

@end
