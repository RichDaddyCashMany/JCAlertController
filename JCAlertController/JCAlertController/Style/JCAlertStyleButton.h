//
//  JCAlertStyleButton.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/6.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAlertStyleButton : NSObject

/**
 高度
 */
@property (nonatomic) CGFloat height;

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

/**
 高亮字体颜色
 */
@property (nonatomic, strong) UIColor *highlightTextColor;

/**
 高亮背景颜色
 */
@property (nonatomic, strong) UIColor *highlightBackgroundColor;

@end
