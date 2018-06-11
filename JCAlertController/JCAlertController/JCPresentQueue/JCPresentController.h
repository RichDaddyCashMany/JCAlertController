//
//  JCPresentController.h
//  JCPresentController
//
//  Created by HJaycee on 2018/5/3.
//  Copyright © 2018年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCPresentController : NSObject

/**
 overlayWindow's default windowLevel is UIWindowLevelNormal, you can modify it

 @param windowLevel windowLevel
 */
+ (void)setOverlayWindowLevel:(UIWindowLevel)windowLevel;

/**
 viewControllers will be presented like LIFO

 @param viewController viewControllerToPresent
 @param presentCompletion be performed after present
 @param dismissCompletion be performed after dismiss
 */
+ (void)presentViewControllerLIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion;

/**
 viewControllers will be presented like FIFO
 
 @param viewController viewControllerToPresent
 @param presentCompletion be performed after present
 @param dismissCompletion be performed after dismiss
 */
+ (void)presentViewControllerFIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion;

@end
