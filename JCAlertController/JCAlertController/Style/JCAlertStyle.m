//
//  JCAlertStyle.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCAlertStyle.h"

@interface JCAlertStyleCache : NSObject

@property (nonatomic, strong) JCAlertStyle *styleNormal;
@property (nonatomic, strong) JCAlertStyle *styleTitleOnly;
@property (nonatomic, strong) JCAlertStyle *styleContentOnly;
@property (nonatomic, strong) JCAlertStyle *styleCustom;

@end

@implementation JCAlertStyleCache

@end

#define JCColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@implementation JCAlertStyle

+ (JCAlertStyle *)styleWithType:(JCAlertType)type {
    static JCAlertStyleCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [JCAlertStyleCache new];
    });
    
    if (type == JCAlertTypeNormal) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache.styleNormal = [[JCAlertStyle alloc] initWithType:JCAlertTypeNormal];
        });
        return cache.styleNormal;
    } else if (type == JCAlertTypeTitleOnly) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache.styleTitleOnly = [[JCAlertStyle alloc] initWithType:JCAlertTypeTitleOnly];
        });
        return cache.styleTitleOnly;
    } else if (type == JCAlertTypeContentOnly) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache.styleContentOnly = [[JCAlertStyle alloc] initWithType:JCAlertTypeContentOnly];
        });
        return cache.styleContentOnly;
    } else {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache.styleCustom = [[JCAlertStyle alloc] initWithType:JCAlertTypeCustom];
        });
        return cache.styleCustom;
    }
}

- (instancetype)initWithType:(JCAlertType)type {
    if (self = [super init]) {
        [self useDefaultStyle];
        
        if (type == JCAlertTypeCustom) {
            [self useCustomStyle];
        } else if (type == JCAlertTypeTitleOnly) {
            [self useTitleOnlyStyle];
        } else if (type == JCAlertTypeContentOnly) {
            [self useContentOnlyStyle];
        }
    }
    return self;
}

- (void)useDefaultStyle {
    JCAlertStyleBackground *background = [JCAlertStyleBackground new];
    background.blur = YES;
    background.canDismiss = NO;
    
    JCAlertStyleAlertView *alertView = [JCAlertStyleAlertView new];
    alertView.width = 280;
    alertView.maxHeight = [UIScreen mainScreen].bounds.size.height - 100;
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.cornerRadius = 8;
    
    JCAlertStyleTitle *title = [JCAlertStyleTitle new];
    title.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    title.font = [UIFont systemFontOfSize:17];
    title.textColor = JCColor(68, 68, 68);
    title.backgroundColor = [UIColor whiteColor];
    
    JCAlertStyleContent *content = [JCAlertStyleContent new];
    content.insets = UIEdgeInsetsMake(0, 10, 10, 10);
    content.font = [UIFont systemFontOfSize:14];
    content.textColor = JCColor(92, 92, 92);
    content.backgroundColor = [UIColor whiteColor];
    
    JCAlertStyleButtonNormal *buttonNormal = [JCAlertStyleButtonNormal new];
    buttonNormal.height = 40;
    buttonNormal.font = [UIFont systemFontOfSize:15];
    buttonNormal.textColor = JCColor(77, 77, 77);
    buttonNormal.backgroundColor = [UIColor whiteColor];
    buttonNormal.highlightTextColor = JCColor(77, 77, 77);
    buttonNormal.highlightBackgroundColor = JCColor(240, 240, 240);
    
    JCAlertStyleButtonCancel *buttonCancel = [JCAlertStyleButtonCancel new];
    buttonCancel.height = 40;
    buttonCancel.font = [UIFont systemFontOfSize:15];
    buttonCancel.textColor = JCColor(150, 150, 150);
    buttonCancel.backgroundColor = [UIColor whiteColor];
    buttonCancel.highlightTextColor = JCColor(150, 150, 150);
    buttonCancel.highlightBackgroundColor = JCColor(240, 240, 240);
    
    JCAlertStyleButtonWarning *buttonWarning = [JCAlertStyleButtonWarning new];
    buttonWarning.height = 40;
    buttonWarning.font = [UIFont systemFontOfSize:15];
    buttonWarning.textColor = JCColor(236, 83, 105);
    buttonWarning.backgroundColor = [UIColor whiteColor];
    buttonWarning.highlightTextColor = JCColor(254, 127, 111);
    buttonWarning.highlightBackgroundColor = JCColor(240, 240, 240);
    
    JCAlertStyleSeparator *separator = [JCAlertStyleSeparator new];
    separator.width = 0.5;
    separator.color = JCColor(240, 240, 240);
    
    self.background = background;
    self.alertView = alertView;
    self.title = title;
    self.content = content;
    self.buttonNormal = buttonNormal;
    self.buttonCancel = buttonCancel;
    self.buttonWarning = buttonWarning;
    self.separator = separator;
}

- (void)useTitleOnlyStyle {
    self.title.insets = UIEdgeInsetsMake(28, 20, 28, 20);
}

- (void)useContentOnlyStyle {
    self.content.insets = UIEdgeInsetsMake(28, 20, 28, 20);
}

- (void)useCustomStyle {
    self.alertView.cornerRadius = 6;
    
    self.buttonNormal.textColor = [UIColor whiteColor];
    self.buttonNormal.highlightTextColor = [UIColor whiteColor];
    self.buttonNormal.backgroundColor = JCColor(41, 43, 60);
    self.buttonNormal.highlightBackgroundColor = [JCColor(41, 43, 51) hightlightedColor];
    
    self.buttonCancel.textColor = [UIColor whiteColor];
    self.buttonCancel.highlightTextColor = [UIColor whiteColor];
    self.buttonCancel.backgroundColor = JCColor(102, 105, 116);
    self.buttonCancel.highlightBackgroundColor = [JCColor(102, 105, 116) hightlightedColor];
    
    self.buttonWarning.textColor = [UIColor whiteColor];
    self.buttonWarning.highlightTextColor = [UIColor whiteColor];
    self.buttonWarning.backgroundColor = JCColor(236, 83, 105);
    self.buttonWarning.highlightBackgroundColor = [JCColor(236, 83, 105) hightlightedColor];
    
    self.separator.color = [UIColor clearColor];
}

@end
