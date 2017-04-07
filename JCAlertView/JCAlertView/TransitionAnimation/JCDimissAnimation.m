//
//  JCDimissAnimationController.m
//  JCAlertView
//
//  Created by HJaycee on 2017/4/1.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCDimissAnimation.h"
#import "JCAlertController.h"

@implementation JCDimissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    JCAlertController *alertController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        alertController.coverView.alpha = 0;
        alertController.blurView.alpha = 0;
        alertController.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        [alertController.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        alertController.alertView.transform = CGAffineTransformMakeScale(0.4, 0.4);
    } completion:^(BOOL finished) {
        alertController.alertView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}
@end
