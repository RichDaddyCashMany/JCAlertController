//
//  JCAlertStyleBackground.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAlertStyleBackground : NSObject

/**
 背景是否模糊
 */
@property (nonatomic) BOOL blur;

/**
 点击背景是否调用dismiss
 */
@property (nonatomic) BOOL canDismiss;

@end
