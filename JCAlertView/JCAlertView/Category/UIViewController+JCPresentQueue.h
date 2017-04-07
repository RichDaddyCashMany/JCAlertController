//
//  UIViewController+presentQueue.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (presentQueue)

/**
 把控制器放入队列，最先放入的最先显示，后面放入的一直等待
 
 @param controller 控制器
 @param presented 控制器present完成
 @param dismissed 控制器dismiss完成
 */
- (void)joinQueueWithController:(UIViewController *)controller presented:(void (^)(void))presented dismissed:(void (^)(void))dismissed;

@end

