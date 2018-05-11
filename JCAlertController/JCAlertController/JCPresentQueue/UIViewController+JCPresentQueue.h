//
//  UIViewController+JCPresentQueue.h
//  JCPresentController
//
//  Created by HJaycee on 2017/4/4.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const JCPresentControllersAllDismissedNotification;

typedef NS_OPTIONS (NSUInteger, JCPresentType) {
    JCPresentTypeLIFO = 0, // last in, first out
    JCPresentTypeFIFO      // first in, last out
};

@interface UIViewController (JCPresentQueue)

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

