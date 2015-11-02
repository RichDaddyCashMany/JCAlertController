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
    
    // Add "Accelerate.frameWork" first in your project otherwise error!
    
    // Multiple buttons
    [JCAlertView showMultipleButtonsWithTitle:@"Contact me" Message:@"Email:hjaycee@163.com\nBlog:http://blog.csdn.net/hjaycee" Click:^(NSInteger index) {
        NSLog(@"click%zi", index);
    } Buttons:@{@(JCAlertViewButtonTypeDefault):@"index = 0"},@{@(JCAlertViewButtonTypeCancel):@"index = 1"},@{@(JCAlertViewButtonTypeWarn):@"index = 2"}, nil];
    
    // One button
    [JCAlertView showOneButtonWithTitle:@"JCAletView" Message:@"1.The simplest UIAlertView replacement. You can use it just write one line of code.\n2.Don't be afraid that the length of message is too long. There is a UITextView to show long message automatically.It supports line break.\n3.Support queue to manager alertViews .\n4.Nice blur background .\n5.Block syntax.\n6.Support iOS 6 and greater.\n7.Please add Accelerate.framework before use.\n8.If you have any question or suggestion please feel free to connect me. Thank you!" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"got it" Click:nil];
    
    // Two buttons
    [JCAlertView showTwoButtonsWithTitle:@"Hi" Message:@"My name is JCAlertView" ButtonType:JCAlertViewButtonTypeCancel ButtonTitle:@"bye" Click:^{
        NSLog(@"click0");
    } ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"hello" Click:^{
        NSLog(@"click1");
    }];
    
}

@end
