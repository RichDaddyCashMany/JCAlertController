//
//  JCAlertStyle.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>
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

@interface JCAlertStyleAlertView : NSObject
@property (nonatomic) CGFloat width; // default 280
@property (nonatomic) CGFloat maxHeight;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic) CGFloat cornerRadius;
@end

@interface JCAlertStyleBackground : NSObject
@property (nonatomic) BOOL blur; // default NO
@property (nonatomic) BOOL canDismiss; // default NO
@property (nonatomic) float alpha; // default 0.3
@end

@interface JCAlertStyleTitle : NSObject
@property (nonatomic) UIEdgeInsets insets;
@property (nonatomic) CGFloat minHeight;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@end

@interface JCAlertStyleButton : NSObject
@property (nonatomic) CGFloat height;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *highlightTextColor;
@property (nonatomic, strong) UIColor *highlightBackgroundColor;
@end

@interface JCAlertStyleButtonNormal : JCAlertStyleButton
@end

@interface JCAlertStyleButtonCancel : JCAlertStyleButton
@end

@interface JCAlertStyleButtonWarning : JCAlertStyleButton
@end

@interface JCAlertStyleContent : NSObject
@property (nonatomic) UIEdgeInsets insets;
@property (nonatomic) CGFloat minHeight;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@end

@interface JCAlertStyleSeparator : NSObject
@property (nonatomic) CGFloat width;
@property (nonatomic, strong) UIColor *color;
@end

@interface JCAlertStyle : NSObject

// Use this get the style instance, then change value of style.xxx.xxx
+ (JCAlertStyle *)styleWithType:(JCAlertType)type;

@property (nonatomic, strong) JCAlertStyleAlertView *alertView;
@property (nonatomic, strong) JCAlertStyleBackground *background;
@property (nonatomic, strong) JCAlertStyleTitle *title;
@property (nonatomic, strong) JCAlertStyleContent *content;
@property (nonatomic, strong) JCAlertStyleButtonNormal *buttonNormal;
@property (nonatomic, strong) JCAlertStyleButtonCancel *buttonCancel;
@property (nonatomic, strong) JCAlertStyleButtonWarning *buttonWarning;
@property (nonatomic, strong) JCAlertStyleSeparator *separator;

@end
