//
//  JCAlertStyle.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCAlertStyleBackground.h"
#import "JCAlertStyleAlertView.h"
#import "JCAlertStyleTitle.h"
#import "JCAlertStyleContent.h"
#import "JCAlertStyleButtonNormal.h"
#import "JCAlertStyleButtonCancel.h"
#import "JCAlertStyleButtonWarning.h"
#import "JCAlertStyleSeparator.h"

/**
 自定义样式请加到这个枚举里，并到实现文件中加上相应的方法
 */
typedef NS_OPTIONS (NSUInteger, JCAlertType){
    JCAlertTypeNormal = 0, // 适合title和content都有的情况，content上间距为零
    JCAlertTypeTitleOnly, // title上下间距加大
    JCAlertTypeContentOnly, // content上下间距加大
    JCAlertTypeAwesome // Awesome样式
};

typedef NS_OPTIONS (NSUInteger, JCButtonType){
    JCButtonTypeNormal = 0,
    JCButtonTypeCancel,
    JCButtonTypeWarning
};

@interface JCAlertStyle : NSObject

- (instancetype)initWithType:(JCAlertType)type;

/**
 背景
 */
@property (nonatomic, strong) JCAlertStyleBackground *background;

/**
 弹窗
 */
@property (nonatomic, strong) JCAlertStyleAlertView *alertView;

/**
 弹窗标题
 */
@property (nonatomic, strong) JCAlertStyleTitle *title;

/**
 弹窗内容
 */
@property (nonatomic, strong) JCAlertStyleContent *content;

/**
 弹窗默认按钮
 */
@property (nonatomic, strong) JCAlertStyleButtonNormal *buttonNormal;

/**
 弹窗取消按钮
 */
@property (nonatomic, strong) JCAlertStyleButtonCancel *buttonCancel;

/**
 弹窗警告按钮
 */
@property (nonatomic, strong) JCAlertStyleButtonWarning *buttonWarning;

/**
 弹窗按钮分隔线
 */
@property (nonatomic, strong) JCAlertStyleSeparator *separator;

@end
