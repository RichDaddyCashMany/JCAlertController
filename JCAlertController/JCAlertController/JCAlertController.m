//
//  JCAlertController.m
//  JCAlertController
//
//  Created by HJaycee on 2017/3/31.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCAlertController.h"
#import "JCAlertView.h"
#import "UIWindow+JCBlur.h"
#import "JCAlertStyle.h"
#import "NSAttributedString+JCCalculateSize.h"
#import "JCAlertButtonItem.h"

@interface JCAlertController ()

@property (nonatomic, strong) UIImageView *blurView;
@property (nonatomic, strong) UIButton *coverView;
@property (nonatomic, strong) JCAlertView *alertView;

@end

#pragma mark - transitionAnimation

@interface JCDimissAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@end

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

@interface JCPresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>
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
        alertController.coverView.alpha = 0.65;
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

@interface JCAlertController () <UIViewControllerTransitioningDelegate, JCAlertViewDelegate>

@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *alertMessage;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *buttonItems;
@property (nonatomic, strong) JCAlertStyle *style;
@property (nonatomic, copy) void(^keyboardShowed)(CGFloat alertHeight, CGFloat keyboardHeight);
@property (nonatomic, copy) void(^keyboardHided)(void);

@end

@implementation JCAlertController

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type {
    return [[self alloc] initWithTitle:title message:message type:type];
}

+ (instancetype)alertWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type {
    return [[self alloc] initWithTitle:title contentView:contentView type:type];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        self.alertTitle = title;
        self.alertMessage = message;
        self.style = [JCAlertStyle styleWithType:type];
        
        if (self.alertTitle.length == 0 && self.alertMessage.length == 0) {
            [NSException raise:@"can not show" format:@"%@: need title or message at least one", self];
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        self.alertTitle = title;
        self.contentView = contentView;
        self.style = [JCAlertStyle styleWithType:type];
        
        if (self.alertTitle.length == 0 && contentView.frame.size.width != self.style.alertView.width) {
            [NSException raise:@"can not show" format:@"%@: title is empty or contentView's width is not equal to alertView's width", self];
        }
    }
    return self;
}

- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed {
    self.keyboardShowed = showed;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)monitorKeyboardHided:(void(^)(void))hided {
    self.keyboardHided = hided;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardShow:(NSNotification *)notification {
    CGRect keyBoardRect = [[[notification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    if (self.keyboardShowed) {
        self.keyboardShowed(self.alertView.frame.size.height, keyBoardRect.size.height);
    }
}

- (void)keyboardHide {
    if (self.keyboardHided) {
        self.keyboardHided();
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)moveAlertViewToCenterY:(CGFloat)centerY animated:(BOOL)animated {
    [UIView animateWithDuration:animated ? 0.25 : 0 animations:^{
        self.alertView.center = CGPointMake(self.alertView.center.x, centerY);
    }];
}

- (void)moveAlertViewToScreenCenterAnimated:(BOOL)animated {
    [self moveAlertViewToCenterY:[UIScreen mainScreen].bounds.size.height / 2 animated:animated];
}

- (NSMutableArray *)buttonItems {
    if (!_buttonItems) {
        _buttonItems = [NSMutableArray arrayWithCapacity:2];
    }
    return _buttonItems;
}

- (void)addButtonWithTitle:(NSString *)title type:(JCButtonType)type clicked:(void (^)(void))clicked {
    if (self.buttonItems.count >= 2) {
        [NSException raise:@"You can add 2 buttons at most" format:@"%@: already has %zi buttons", self, self.buttonItems.count];
    }
    
    JCAlertButtonItem *item = [JCAlertButtonItem new];
    item.title = title;
    item.type = type;
    item.clicked = clicked;
    [self.buttonItems addObject:item];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBlurView];
    [self setupAlphaCoverView];
    [self setupAlertView];
}

- (void)setupBlurView {
    if (self.style.background.blur) {
        // check the window
        NSArray* reversedWindows = [[[UIApplication sharedApplication].windows reverseObjectEnumerator] allObjects];
        for (UIWindow *window in reversedWindows) {
            if ([NSStringFromClass([window class]) isEqualToString:@"UIWindow"] && CGRectEqualToRect(window.frame, [UIScreen mainScreen].bounds)) {
                self.blurView = [window blurScreenshot];
                [self.view addSubview:self.blurView];
                break;
            }
        }
    }
}

- (void)setupAlphaCoverView {
    self.coverView = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.coverView.backgroundColor = [UIColor colorWithRed:5/255.0 green:0 blue:10/255.0 alpha:1.0];
    [self.view addSubview:self.coverView];
    if (self.style.background.canDismiss) {
        [self.coverView addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setupAlertView {
    self.alertView = [JCAlertView new];
    self.alertView.title = self.alertTitle;
    self.alertView.message = self.alertMessage;
    self.alertView.contentView = self.contentView;
    self.alertView.buttonItems = self.buttonItems;
    self.alertView.style = self.style;
    self.alertView.backgroundColor = self.style.alertView.backgroundColor;
    self.alertView.delegate = self;
    [self.view addSubview:self.alertView];
}

- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - transtionAnimation
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [JCPresentAnimation new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [JCDimissAnimation new];
}

#pragma mark - JCAlertViewDelegate
- (void)alertButtonClicked:(void (^)(void))clicked {
    [self dismissViewControllerAnimated:YES completion:^{
        if (clicked) {
            clicked();
        }
    }];
}

@end
