//
//  NormalVCForPresentation.m
//  JCAlertController
//
//  Created by weiping.lii on 30/03/2018.
//  Copyright © 2018 HJaycee. All rights reserved.
//

#import "NormalVCForPresentation.h"

@interface NormalVCForPresentation ()

@end

@implementation NormalVCForPresentation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStyleDone target:self action:@selector(onDismiss)];
    self.navigationItem.leftBarButtonItem = item;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)onDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
