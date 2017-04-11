//
//  JCAlertStyle.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCAlertStyleBackground.h"
#import "JCAlertStyleAlertView.h"
#import "JCAlertStyleTitle.h"
#import "JCAlertStyleContent.h"
#import "JCAlertStyleButtonNormal.h"
#import "JCAlertStyleButtonCancel.h"
#import "JCAlertStyleButtonWarning.h"
#import "JCAlertStyleSeparator.h"
#import "UIColor+JCHightlightedColor.h"

typedef NS_OPTIONS (NSUInteger, JCAlertType){
    JCAlertTypeNormal = 0,   // title and content both exist：content's insets.top == 0
    JCAlertTypeTitleOnly,    // title only exists：title's insets.top and insets.bottom == 0
    JCAlertTypeContentOnly,  // content only exists：content's insets.top and insets.bottom == 0
    JCAlertTypeCustom        // custom style
};

typedef NS_OPTIONS (NSUInteger, JCButtonType){
    JCButtonTypeNormal = 0,
    JCButtonTypeCancel,
    JCButtonTypeWarning
};

@interface JCAlertStyle : NSObject

/**
 Get JCAlertStyle instance.

 @param type alertView type
 @return JCAlertStyle
 */
+ (JCAlertStyle *)styleWithType:(JCAlertType)type;

@property (nonatomic, strong) JCAlertStyleBackground *background;
@property (nonatomic, strong) JCAlertStyleAlertView *alertView;
@property (nonatomic, strong) JCAlertStyleTitle *title;
@property (nonatomic, strong) JCAlertStyleContent *content;
@property (nonatomic, strong) JCAlertStyleButtonNormal *buttonNormal;
@property (nonatomic, strong) JCAlertStyleButtonCancel *buttonCancel;
@property (nonatomic, strong) JCAlertStyleButtonWarning *buttonWarning;
@property (nonatomic, strong) JCAlertStyleSeparator *separator;

@end
