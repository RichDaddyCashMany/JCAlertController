//
//  JCAlertController.h
//  JCAlertController
//
//  Created by HJaycee on 2017/3/31.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+JCPresentQueue.h"
#import "JCAlertStyle.h"

/**
 Same level with UIAlertController.
 Use method 'jc_presentViewController...' in 'UIViewController+JCPresentQueue.h'，It accouts with FIFO or LIFO.
 Use +[JCAlertStyle styleWithType:JCAlertType] to change the style of alertView.
 */
@interface JCAlertController : UIViewController

/**
 Class method to new 'JCAlertController' instance
 alertView has title、message、buttons
 
 @param title alertView' title
 @param message alertView's content
 @param type this is a enum value
 @return JCAlertController instance
 */
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type;

/**
 Class method to new 'JCAlertController' instance
 alertView has title、message、buttons
 
 @param title alertView' title
 @param contentView alertView's content
 @param type this is a enum value
 @return JCAlertController instance
 */
+ (instancetype)alertWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type;

/**
 Method to new 'JCAlertController' instance
 alertView has title、message、buttons
 
 @param title alertView' title
 @param message alertView's content
 @param type this is a enum value
 @return JCAlertController instance
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(JCAlertType)type;

/**
 Method to new 'JCAlertController' instance
 alertView has title、message、buttons
 
 @param title alertView' title
 @param contentView alertView's content
 @param type this is a enum value
 @return JCAlertController instance
 */
- (instancetype)initWithTitle:(NSString *)title contentView:(UIView *)contentView type:(JCAlertType)type;

/**
 Add button on alertView with title and action
 
 @param title button's title
 @param type this is a enum value
 @param clicked callback after clicked
 */
- (void)addButtonWithTitle:(NSString *)title type:(JCButtonType)type clicked:(void (^)(void))clicked;

/**
 Monitor keyboard showed state
 
 @param showed callback after keyboard showed
 */
- (void)monitorKeyboardShowed:(void(^)(CGFloat alertHeight, CGFloat keyboardHeight))showed;

/**
 Monitor keyboard hided state
 
 @param hided callback after keyboard hided
 */
- (void)monitorKeyboardHided:(void(^)(void))hided;

/**
 Move alertView to new centerY to avoid the keyboard
 
 @param centerY centerY
 @param animated is animated
 */
- (void)moveAlertViewToCenterY:(CGFloat)centerY animated:(BOOL)animated;

/**
 Move alertView to center of screen
 
 @param animated is animated
 */
- (void)moveAlertViewToScreenCenterAnimated:(BOOL)animated;

@end
