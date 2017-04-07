//
//  JCAlertStyleAlertView.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAlertStyleAlertView : NSObject

/**
 alertView的固定宽度
 */
@property (nonatomic) CGFloat width;

/**
 alertView的最大高度
 */
@property (nonatomic) CGFloat maxHeight;

/**
 alertView的背景色
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 alertView的圆角
 */
@property (nonatomic) CGFloat cornerRadius;

@end
