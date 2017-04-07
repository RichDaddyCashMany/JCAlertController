//
//  JCAlertView.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCAlertStyle.h"

#define JCAlertOriginCenterY ([UIScreen mainScreen].bounds.size.height / 2)

/**
 该类对JCAlertController做了一层封装，实际弹出的是JCAlertController，和UIAlertController同级
 */
@interface JCAlertView : NSObject

/**
 创建一个alert，由title、message、按钮组成

 @param title 标题
 @param message 文字内容
 @param type alert样式
 @return JCAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type;

/**
 创建一个alert，由title、自定义contentView、按钮组成，title和按钮可不设置

 @param title 标题
 @param contentView 介于标题和按钮中间的view
 @param type alert样式
 @return JCAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type;

/**
 给alert加上按钮和点击回调

 @param button 按钮标题
 @param type 按钮样式
 @param clicked 点击回调
 */
- (void)addButton:(NSString *)button type:(JCButtonType)type clicked:(void (^)(void))clicked;

/**
 显示到控制器上，内部是该控制器present->JCAlertController

 @param controller 控制器
 */
- (void)showOnController:(UIViewController *)controller;

/**
 显示到控制器上，内部是该控制器present->JCAlertController，这个方法只是多了两个状态回调

 @param controller 控制器
 @param presented present完成后的回调
 @param dismissed dismiss完成后的回调
 */
- (void)showOnController:(UIViewController *)controller presented:(void (^)(void))presented dismissed:(void (^)(void))dismissed;

/**
 自定义contentView的alert可以通过该方法dismiss，前提是alert已经被present出来
 */
- (void)dismissIfAllowed;

/**
 监听键盘状态，自定义contentView内有输入框的时候可以对alert位置进行上调处理

 @param showed 键盘出现回调
 */
- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed;

/**
 监听键盘状态

 @param hided 键盘消失回调
 */
- (void)monitorKeyboardHided:(void(^)(void))hided;

/**
 移动到新的centerY，用于解决键盘弹出后的遮挡问题

 @param centerY centerY
 @param animated 是否动画
 */
- (void)moveToCenterY:(CGFloat)centerY animated:(BOOL)animated;

@end
