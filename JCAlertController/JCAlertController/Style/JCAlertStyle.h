//
//  JCAlertStyle.h
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+JCHightlightedColor.h"

typedef NS_OPTIONS (NSUInteger, JCButtonType){
    JCButtonTypeNormal = 0,
    JCButtonTypeCancel,
    JCButtonTypeWarning
};

@interface JCAlertStyleAlertView : NSObject
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat maxHeight;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic) CGFloat cornerRadius;
@end

@interface JCAlertStyleBackground : NSObject
@property (nonatomic) BOOL blur;
@property (nonatomic) BOOL canDismiss; // dismissed with touched the bg
@property (nonatomic) float alpha;
@end

@interface JCAlertStyleTitle : NSObject
@property (nonatomic) UIEdgeInsets insets;
@property (nonatomic) UIEdgeInsets onlyTitleInsets;
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
@property (nonatomic) UIEdgeInsets onlyMessageInsets;
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

@property (nonatomic, strong) JCAlertStyleAlertView *alertView;
@property (nonatomic, strong) JCAlertStyleBackground *background;
@property (nonatomic, strong) JCAlertStyleTitle *title;
@property (nonatomic, strong) JCAlertStyleContent *content;
@property (nonatomic, strong) JCAlertStyleButtonNormal *buttonNormal;
@property (nonatomic, strong) JCAlertStyleButtonCancel *buttonCancel;
@property (nonatomic, strong) JCAlertStyleButtonWarning *buttonWarning;
@property (nonatomic, strong) JCAlertStyleSeparator *separator;

+ (instancetype)shareStyle;

@end

@interface JCAlertStyle (Deprecated)

typedef NS_OPTIONS (NSUInteger, JCAlertType){
    JCAlertTypeNormal NS_ENUM_DEPRECATED_IOS(2.0, 6.0, "No longer support") = 0,
    JCAlertTypeTitleOnly NS_ENUM_DEPRECATED_IOS(2.0, 6.0, "No longer support"),
    JCAlertTypeContentOnly NS_ENUM_DEPRECATED_IOS(2.0, 6.0, "No longer support"),
    JCAlertTypeCustom NS_ENUM_DEPRECATED_IOS(2.0, 6.0, "No longer support")
};

+ (JCAlertStyle *)styleWithType:(JCAlertType)type NS_DEPRECATED_IOS(2.0, 6.0, "Use + (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message; please!");

@end
