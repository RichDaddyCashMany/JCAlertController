//
//  JCAlertController.h
//  JCAlertView
//
//  Created by HJaycee on 2017/3/31.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCAlertNormalView.h"
#import "JCAlertView.h"

@interface JCAlertController : UIViewController

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type;
- (instancetype)initWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type;
- (void)addButton:(NSString *)button type:(JCButtonType)type clicked:(void (^)(void))clicked;
- (void)dismissIfAllowed;
- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed;
- (void)monitorKeyboardHided:(void(^)(void))hided;
- (void)moveToCenterY:(CGFloat)centerY animated:(BOOL)animated;

@property (nonatomic, strong) UIImageView *blurView;
@property (nonatomic, strong) UIButton *coverView;
@property (nonatomic, weak) UIView *alertView;

@end
