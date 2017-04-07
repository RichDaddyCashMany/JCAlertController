//
//  JCAlertController.h
//  JCAlertController
//
//  Created by HJaycee on 2017/3/31.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+JCPresentQueue.h"
#import "JCAlertStyle.h"

/**
 与UIAlertController同级的弹窗控制器。
 使用"UIViewController+JCPresentQueue.h"中的"jc_presentViewController..."方法，可以使JCAlertController具有队列弹出能力。
 调用+[JCAlertStyle styleWithType:JCAlertType]，可以对样式进行修改。
 */
@interface JCAlertController : UIViewController

/**
 创建JCAlertController实例。
 alertView由title、message、按钮组成
 
 @param title 标题
 @param message 文字内容
 @param type alertView样式
 @return JCAlertController
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type;

/**
 创建JCAlertController实例。
 alertView由title、自定义contentView、按钮组成，title和按钮可不设置
 
 @param title 标题
 @param contentView 介于标题和按钮中间的view
 @param type alertView样式
 @return JCAlertController
 */
- (instancetype)initWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type;

/**
 给alertView加上按钮和点击回调
 
 @param title 按钮标题
 @param type 按钮样式
 @param clicked 点击回调
 */
- (void)addButtonWithTitle:(NSString *)title type:(JCButtonType)type clicked:(void (^)(void))clicked;

/**
 监听键盘显示，自定义contentView内有输入框的时候可以对alertView位置进行上移处理
 
 @param showed 键盘出现回调
 */
- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed;

/**
 监听键盘隐藏
 
 @param hided 键盘消失回调
 */
- (void)monitorKeyboardHided:(void(^)(void))hided;

/**
 把alertView移动到新的centerY，以免被键盘遮挡
 
 @param centerY centerY
 @param animated 是否动画
 */
- (void)moveAlertViewToCenterY:(CGFloat)centerY animated:(BOOL)animated;

/**
 把alertView移动到屏幕中间
 */
- (void)moveAlertViewToScreenCenterAnimated:(BOOL)animated;

@end
