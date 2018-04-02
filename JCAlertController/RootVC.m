//
//  TestVC.m
//  JCAlertController
//
//  Created by weiping.lii on 29/03/2018.
//  Copyright © 2018 HJaycee. All rights reserved.
//

#import "RootVC.h"
#import "ViewController.h"

@interface RootVC ()

@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) UIButton *presentButton;

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.presentButton];
    
    self.pushButton.frame = CGRectMake(50, 200, 100, 50);
    self.presentButton.frame = CGRectMake(50, 300, 100, 50);
}

- (void)onPushButtonClicked:(UIButton *)button {
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onPresentButtonClicked:(UIButton *)button {
    ViewController *vc = [ViewController new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIButton *)pushButton {
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton setTitle:@"Push" forState:UIControlStateNormal];
        _pushButton.backgroundColor = [UIColor blackColor];
        [_pushButton addTarget:self action:@selector(onPushButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (UIButton *)presentButton {
    if (!_presentButton) {
        _presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_presentButton setTitle:@"Present" forState:UIControlStateNormal];
        _presentButton.backgroundColor = [UIColor blackColor];
        [_presentButton addTarget:self action:@selector(onPresentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentButton;
}


@end




