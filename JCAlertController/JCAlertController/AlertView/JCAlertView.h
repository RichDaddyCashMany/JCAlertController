//
//  JCAlertController.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/1.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCAlertStyle.h"

@protocol JCAlertViewDelegate <NSObject>

- (void)alertButtonClicked:(void(^)(void))clicked;

@end

@interface JCAlertView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSArray *buttonItems;
@property (nonatomic, strong) JCAlertStyle *style;

@property (nonatomic, weak) id <JCAlertViewDelegate> delegate;

@end
