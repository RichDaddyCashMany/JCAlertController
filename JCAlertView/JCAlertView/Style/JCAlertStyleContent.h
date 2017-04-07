//
//  JCAlertStyleContent.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAlertStyleContent : NSObject

/**
 四个方向的内边距 ps：出于显示效果考虑，如果设置了title，content的insets.top会自动设置为0
 */
@property (nonatomic) UIEdgeInsets insets;

/**
 最小高度
 */
@property (nonatomic) CGFloat minHeight;

/**
 字体
 */
@property (nonatomic, strong) UIFont *font;

/**
 字体颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 背景颜色
 */
@property (nonatomic, strong) UIColor *backgroundColor;

@end
