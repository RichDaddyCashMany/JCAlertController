//
//  UIViewController+JCPresentQueue.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (JCPresentQueue)

/**
 把控制器放入队列，最先放入的最先被present出来，后面放入的会一直等待
 
 @param controller 将被present出来的控制器
 @param presentCompletion 控制器present完成
 @param dismissCompletion 控制器dismiss完成
 */
- (void)jc_presentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion;

@end

