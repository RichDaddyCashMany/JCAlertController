//
//  JCAlertView.m
//  JCAlertView
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCAlertView.h"
#import "JCAlertController.h"
#import <objc/runtime.h>
#import "UIViewController+JCPresentQueue.h"

@interface JCAlertView ()

@property (nonatomic, strong) JCAlertController *alertController;

@end

@implementation JCAlertView

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type {
    JCAlertView *alertView = [JCAlertView new];
    JCAlertController *alertController = [[JCAlertController alloc] initWithTitle:title message:message type:type];
    alertView.alertController = alertController;
    return alertView;
}

+ (instancetype)alertWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type {
    JCAlertView *alertView = [JCAlertView new];
    JCAlertController *alertController = [[JCAlertController alloc] initWithTitle:title contentView:contentView type:type];
    alertView.alertController = alertController;
    return alertView;
}

- (void)addButton:(NSString *)button type:(JCButtonType)type clicked:(void (^)(void))clicked {
    [self.alertController addButton:button type:type clicked:clicked];
}

- (void)showOnController:(UIViewController *)controller {
    [self showOnController:controller presented:nil dismissed:nil];
}

- (void)showOnController:(UIViewController *)controller presented:(void (^)(void))presented dismissed:(void (^)(void))dismissed {
    [controller joinQueueWithController:self.alertController presented:^{
        if (presented) presented();
    } dismissed:^{
        if (dismissed) dismissed();
    }];
}

- (void)dismissIfAllowed {
    [self.alertController dismissIfAllowed];
}

- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed {
    [self.alertController monitorKeyboardShowed:showed];
}

- (void)monitorKeyboardHided:(void (^)(void))hided {
    [self.alertController monitorKeyboardHided:hided];
}

- (void)moveToCenterY:(CGFloat)centerY animated:(BOOL)animated {
    [self.alertController moveToCenterY:centerY animated:animated];
}

@end
