//
//  ViewController.m
//  JCAlertView-master
//
//  Created by mac on 15/10/30.
//  Copyright © 2015年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertView.h"

@interface ViewController ()
{
    JCAlertView *_alert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Just background, please ignore
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    imageView.frame = self.view.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Add "Accelerate.frameWork" first in your project otherwise error! (If you use cocoapods please ignore.)
    
    // Multiple buttons
    [self showAlertWithMoreThanTwoButtons];
    
    // One button
    [self showAlertWithOneButton];
    
    // Two buttons
    [self showAlertWithTwoButtons];

    // this alert can't be dismissed by touch the background
    [self showAlertWithCustomView];
    
    // this alert can be dismissed by touch the background
    [self showAlertWithCustomView1];
    
    
}

- (void)showAlertWithOneButton{
    [JCAlertView showOneButtonWithTitle:@"JCAletView" Message:@"1.The simplest UIAlertView replacement. You can use it just write one line of code.\n2.Don't be afraid that the length of message is too long. There is a UITextView to show long message automatically.It supports line break.\n3.Support queue to manager alertViews .\n4.Nice blur background .\n5.Block syntax.\n6.Support iOS 6 and greater.\n7.Please add Accelerate.framework before use.\n8.If you have any question or suggestion please feel free to connect me. Thank you!" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"got it" Click:nil];
}

- (void)showAlertWithTwoButtons{
    [JCAlertView showTwoButtonsWithTitle:@"Hi" Message:@"My name is JCAlertView" ButtonType:JCAlertViewButtonTypeCancel ButtonTitle:@"bye" Click:^{
        NSLog(@"click0");
    } ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"hello" Click:^{
        NSLog(@"click1");
    }];
}

- (void)showAlertWithMoreThanTwoButtons{
    [JCAlertView showMultipleButtonsWithTitle:@"Contact me" Message:@"Email:hjaycee@163.com\nBlog:http://blog.csdn.net/hjaycee" Click:^(NSInteger index) {
        NSLog(@"click%zi", index);
    } Buttons:@{@(JCAlertViewButtonTypeDefault):@"index = 0"},@{@(JCAlertViewButtonTypeCancel):@"index = 1"},@{@(JCAlertViewButtonTypeWarn):@"index = 2"}, nil];
}

- (void)showAlertWithCustomView{
    // create a customView with a button inside
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 200)];
    customView.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    btn.center = CGPointMake(120, 100);
    [customView addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // dismissWhenTouchedBackground:NO
    _alert = [[JCAlertView alloc] initWithCustomView:customView dismissWhenTouchedBackground:NO];
    [_alert show];
}

- (void)showAlertWithCustomView1{
    // create a customView with a image
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alertImage"]];
    
    // dismissWhenTouchedBackground:YES
    JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:imageView dismissWhenTouchedBackground:YES];
    [customAlert show];
}

- (void)btnClick{
    // usually you can fill nil in the parameter
    // [_alert dismissWithCompletion:nil];
    
    [_alert dismissWithCompletion:^{
        // in this block, alert resigns the keywindow.
        // you can do something about other keywindow here.
    }];
}

@end
