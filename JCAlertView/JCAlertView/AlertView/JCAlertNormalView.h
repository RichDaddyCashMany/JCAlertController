//
//  JCAlertNormalView.h
//  JCAlertView
//
//  Created by HJaycee on 2017/4/1.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCAlertStyle.h"

@protocol JCAlertNormalViewDelegate <NSObject>

- (void)alertBtnClickd;

@end

@interface JCAlertNormalView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSArray *buttonItems;
@property (nonatomic, strong) JCAlertStyle *style;

@property (nonatomic, weak) id <JCAlertNormalViewDelegate> delegate;

@end
