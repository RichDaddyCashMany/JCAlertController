//
//  JCPresentAnimation.m
//  JCAlertView
//
//  Created by HJaycee on 2017/4/1.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCPresentAnimation.h"
#import "JCAlertController.h"

@interface JCPresentAnimation () 

@end

@implementation JCPresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    JCAlertController *alertController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [[transitionContext containerView] addSubview:alertController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    alertController.blurView.alpha = 0;
    alertController.alertView.alpha = 0;
    alertController.coverView.alpha = 0;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        alertController.blurView.alpha = 1;
        alertController.coverView.alpha = 0.5;
        alertController.alertView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(0.8), @(1.05), @(1.1), @(1)];
    animation.keyTimes = @[@(0), @(0.3), @(0.5), @(1.0)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.duration = duration;
    [alertController.alertView.layer addAnimation:animation forKey:@"bouce"];
}

@end
