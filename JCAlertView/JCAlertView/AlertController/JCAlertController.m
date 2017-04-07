//
//  JCAlertController.m
//  JCAlertView
//
//  Created by HJaycee on 2017/3/31.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCAlertController.h"
#import "JCAlertNormalView.h"
#import "JCPresentAnimation.h"
#import "JCDimissAnimation.h"
#import "UIWindow+JCBlur.h"
#import "JCAlertStyle.h"
#import "NSAttributedString+JCCalculateSize.h"
#import "JCAlertButtonItem.h"

@interface JCAlertController () <UIViewControllerTransitioningDelegate, JCAlertNormalViewDelegate>

@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *alertMessage;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *buttonItems;
@property (nonatomic, strong) JCAlertStyle *style;
@property (nonatomic) BOOL showing;
@property (nonatomic, copy) void(^keyboardShowed)(CGFloat alertHeight, CGFloat keyboardHeight);
@property (nonatomic, copy) void(^keyboardHided)(void);

@end

@implementation JCAlertController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.showing = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.showing = YES;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        
        self.alertTitle = title;
        self.alertMessage = message;
        self.style = [[JCAlertStyle alloc] initWithType:type];
        
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
        self.style = [[JCAlertStyle alloc] initWithType:type];
        
        if (self.alertTitle.length == 0 && contentView.frame.size.width != self.style.alertView.width) {
            [NSException raise:@"can not show" format:@"%@: title is empty or contentView's width is not equal to alertView's width", self];
        }
    }
    return self;
}

- (void)dismissIfAllowed {
    if (self.showing) {
        [self dismiss];
    }
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

- (void)moveToCenterY:(CGFloat)centerY animated:(BOOL)animated {
    [UIView animateWithDuration:animated ? 0.25 : 0 animations:^{
        self.alertView.center = CGPointMake(self.alertView.center.x, centerY);
    }];
}

- (NSMutableArray *)buttonItems {
    if (!_buttonItems) {
        _buttonItems = [NSMutableArray arrayWithCapacity:2];
    }
    return _buttonItems;
}

- (void)addButton:(NSString *)button type:(JCButtonType)type clicked:(void (^)(void))clicked {
    if (self.buttonItems.count >= 2) {
        [NSException raise:@"You can add 2 buttons at most" format:@"%@: already has %zi buttons", self, self.buttonItems.count];
    }
    
    JCAlertButtonItem *item = [JCAlertButtonItem new];
    item.title = button;
    item.type = type;
    item.clicked = clicked;
    [self.buttonItems addObject:item];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JCAlertStyle *style = self.style;
    
    if (style.background.blur) {
        // 判断是不是键盘或其它不相干的window
        NSArray* reversedWindows = [[[UIApplication sharedApplication].windows reverseObjectEnumerator] allObjects];
        for (UIWindow *window in reversedWindows) {
            if ([NSStringFromClass([window class]) isEqualToString:@"UIWindow"] && CGRectEqualToRect(window.frame, [UIScreen mainScreen].bounds)) {
                self.blurView = [window blurScreenshot];
                [self.view addSubview:self.blurView];
                break;
            }
        }
    }

    self.coverView = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.coverView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.coverView];
    
    if (style.background.canDismiss) {
        [self.coverView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    
    JCAlertNormalView *alertView = [JCAlertNormalView new];
    alertView.title = self.alertTitle;
    alertView.message = self.alertMessage;
    alertView.contentView = self.contentView;
    alertView.buttonItems = self.buttonItems;
    alertView.style = self.style;
    alertView.backgroundColor = style.alertView.backgroundColor;
    alertView.delegate = self;
    [self.view addSubview:alertView];
    self.alertView = alertView;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - transtionAnimation

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [JCPresentAnimation new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [JCDimissAnimation new];
}

#pragma mark - JCAlertNormalViewDelegate

- (void)alertBtnClickd {
    [self dismiss];
}

@end
