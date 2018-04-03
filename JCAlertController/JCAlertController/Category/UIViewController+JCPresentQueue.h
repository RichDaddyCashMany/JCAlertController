//
//  UIViewController+JCPresentQueue.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//
// This is a category in https://github.com/HJaycee/JCAlertController

#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSUInteger, JCPresentType) {
    JCPresentTypeIdle = 0,
    JCPresentTypeLIFO , // last in, first out
    JCPresentTypeFIFO      // first in, last out
};

@protocol JCPresentFallbackDelegate <NSObject>

@optional;
- (UIViewController *)jc_fallbackPresentingViewControllerForCachedPresentations;

@end

@interface UIViewController (JCPresentQueue)

@property (assign, nonatomic, class) id<JCPresentFallbackDelegate>jc_delegate;

+ (void)jc_cancelAllQueuedOperations;

/**
 Present any controller with LIFO. Recommend to use this method.
 */
- (void)jc_presentViewController:(UIViewController *)controller presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion;

/**
 Present any controller with LIFO or FIFO.
 Choose one to use, dont't use LIFO and FIFO two together.
 
 @param controller any controller inherits in UIViewController
 @param presentType JCPresentTypeLIFO or JCPresentTypeFIFO
 @param presentCompletion callback if presented
 @param dismissCompletion callback if dismissed
 */
- (void)jc_presentViewController:(UIViewController *)controller presentType:(JCPresentType)presentType presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion;


@end

