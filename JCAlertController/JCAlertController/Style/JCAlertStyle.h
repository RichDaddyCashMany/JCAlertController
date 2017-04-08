//
//  JCAlertStyle.h
//  JCAlertController
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
#import "UIColor+JCHightlightedColor.h"

typedef NS_OPTIONS (NSUInteger, JCAlertType){
    JCAlertTypeNormal = 0,   // 适合title和content都有的情况：此时content的insets.top为零
    JCAlertTypeTitleOnly,    // 适合只有title的情况：title的insets.top和insets.bottom加大
    JCAlertTypeContentOnly,  // 适合只有content的情况：content的insets.top和insets.bottom加大
    JCAlertTypeCustom        // 自定义样式
};

typedef NS_OPTIONS (NSUInteger, JCButtonType){
    JCButtonTypeNormal = 0,
    JCButtonTypeCancel,
    JCButtonTypeWarning
};

@interface JCAlertStyle : NSObject

/**
 获取JCAlertStyle单例

 @param type alertView类型
 @return 对应枚举类型的JCAlertStyle
 */
+ (JCAlertStyle *)styleWithType:(JCAlertType)type;

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
