//
//  JCAlertController.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/1.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "JCAlertView.h"
#import "NSAttributedString+JCCalculateSize.h"
#import "JCAlertButtonItem.h"
#import "UIImage+JCColor2Image.h"

@interface JCAlertView ()

@property (nonatomic) CGFloat buttonHeight;

@end

@implementation JCAlertView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    JCAlertStyle *style = self.style;
    
    // button height
    self.buttonHeight = self.buttonItems.count > 0 ? style.buttonNormal.height : 0;
    
    // cal title height
    CGFloat titleHeight = 0;
    CGSize titleSize = CGSizeZero;
    if (self.title.length > 0) {
        NSAttributedString *titleStr = [[NSAttributedString alloc] initWithString:self.title attributes:@{NSFontAttributeName:style.title.font}];
        titleSize = [titleStr sizeWithMaxWidth:style.alertView.width - style.title.insets.left - style.title.insets.right];
        titleHeight = titleSize.height + style.title.insets.top + style.title.insets.bottom;
    }
    
    // title one line height
    NSAttributedString *titleChar = [[NSAttributedString alloc] initWithString:@" " attributes:@{NSFontAttributeName:style.title.font}];
    CGFloat titleCharHeight = [titleChar sizeWithMaxWidth:self.frame.size.width].height;
    
    // if has contentView
    if (self.contentView) {
        self.frame = CGRectMake(0, 0, style.alertView.width, titleHeight + self.contentView.frame.size.height + self.buttonHeight);
        
        if (titleHeight > 0) {
            if (titleSize.height == titleCharHeight) { // show in center
                UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(style.title.insets.left, style.title.insets.top, style.alertView.width - style.title.insets.left - style.title.insets.right, titleCharHeight)];
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.textAlignment = NSTextAlignmentCenter;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                bgView.backgroundColor = style.title.backgroundColor;
                [bgView addSubview:titleView];
                
                [self addSubview:bgView];
            } else { // break line use textview
                UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                titleView.textContainerInset = style.title.insets;
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.editable = NO;
                titleView.selectable = NO;
                titleView.scrollEnabled = NO;
                [self addSubview:titleView];
            }
        }
        
        CGRect contentFrame = self.contentView.frame;
        contentFrame.origin.y = titleHeight;
        self.contentView.frame = contentFrame;
        [self addSubview:self.contentView];
        
        [self setupButton];
        
        if (titleHeight + self.buttonHeight > 0) {
            self.layer.cornerRadius = style.alertView.cornerRadius;
            if (self.layer.cornerRadius > 0) {
                self.clipsToBounds = YES;
            }
        }
        
        self.center = newSuperview.center;
        return;
    }
    
    // title height than max
    CGFloat maxUnstretchTitleHeight = style.alertView.maxHeight - self.buttonHeight;
    
    // cal content height
    CGFloat contentHeight = 0;
    CGSize contentSize = CGSizeZero;
    if (self.message.length > 0) {
        NSAttributedString *contentStr = [[NSAttributedString alloc] initWithString:self.message attributes:@{NSFontAttributeName:style.content.font}];
        contentSize = [contentStr sizeWithMaxWidth:style.alertView.width - style.content.insets.left - style.content.insets.right];
        contentHeight = contentSize.height + style.content.insets.top + style.content.insets.bottom;
    }
    
    // content one line height
    NSAttributedString *contentChar = [[NSAttributedString alloc] initWithString:@" " attributes:@{NSFontAttributeName:style.content.font}];
    CGFloat contentCharHeight = [contentChar sizeWithMaxWidth:self.frame.size.width].height;
    
    // give alert frame
    if (titleHeight + contentHeight + self.buttonHeight > style.alertView.maxHeight) {
        self.frame = CGRectMake(0, 0, style.alertView.width, style.alertView.maxHeight);
    } else {
        self.frame = CGRectMake(0, 0, style.alertView.width, titleHeight + contentHeight + self.buttonHeight);
    }
    
    // layout
    if (titleHeight + contentHeight + self.buttonHeight < style.alertView.maxHeight) { // in max height
        if (titleHeight > 0) {
            if (titleSize.height == titleCharHeight) { // show in center
                UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(style.title.insets.left, style.title.insets.top, style.alertView.width - style.title.insets.left - style.title.insets.right, titleCharHeight)];
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.textAlignment = NSTextAlignmentCenter;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                bgView.backgroundColor = style.title.backgroundColor;
                [bgView addSubview:titleView];
                
                [self addSubview:bgView];
            } else {
                UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                titleView.textContainerInset = style.title.insets;
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.editable = NO;
                titleView.selectable = NO;
                titleView.scrollEnabled = NO;
                [self addSubview:titleView];
            }
        }
        
        if (contentHeight > 0) {
            if (contentSize.height == contentCharHeight) {
                UILabel *contentView = [[UILabel alloc] initWithFrame:CGRectMake(style.content.insets.left, style.content.insets.top, style.alertView.width - style.content.insets.left - style.content.insets.right, contentCharHeight)];
                contentView.text = self.message;
                contentView.font = style.content.font;
                contentView.textColor = style.content.textColor;
                contentView.backgroundColor = style.content.backgroundColor;
                contentView.textAlignment = NSTextAlignmentCenter;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, contentHeight)];
                bgView.backgroundColor = style.content.backgroundColor;
                [bgView addSubview:contentView];
                
                [self addSubview:bgView];
            } else {
                UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, contentHeight)];
                contentView.textContainerInset = style.content.insets;
                contentView.text = self.message;
                contentView.font = style.content.font;
                contentView.textColor = style.content.textColor;
                contentView.backgroundColor = style.content.backgroundColor;
                contentView.editable = NO;
                contentView.selectable = NO;
                contentView.scrollEnabled = NO;
                [self addSubview:contentView];
            }
        }

        [self setupButton];
    } else {
        if (titleHeight > maxUnstretchTitleHeight) { // title scrollable
            UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, maxUnstretchTitleHeight)];
            titleView.textContainerInset = style.title.insets;
            titleView.text = self.title;
            titleView.font = style.title.font;
            titleView.textColor = style.title.textColor;
            titleView.backgroundColor = style.title.backgroundColor;
            titleView.editable = NO;
            titleView.selectable = NO;
            [self addSubview:titleView];

            [self setupButton];
        } else { // content scrollable
            if (titleHeight > 0) {
                if (titleSize.height == titleCharHeight) { // show in center
                    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(style.title.insets.left, style.title.insets.top, style.alertView.width - style.title.insets.left - style.title.insets.right, titleCharHeight)];
                    titleView.text = self.title;
                    titleView.font = style.title.font;
                    titleView.textColor = style.title.textColor;
                    titleView.backgroundColor = style.title.backgroundColor;
                    titleView.textAlignment = NSTextAlignmentCenter;
                    
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                    bgView.backgroundColor = style.title.backgroundColor;
                    [bgView addSubview:titleView];
                    
                    [self addSubview:bgView];
                } else { 
                    UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                    titleView.textContainerInset = style.title.insets;
                    titleView.text = self.title;
                    titleView.font = style.title.font;
                    titleView.textColor = style.title.textColor;
                    titleView.backgroundColor = style.title.backgroundColor;
                    titleView.editable = NO;
                    titleView.selectable = NO;
                    titleView.scrollEnabled = NO;
                    [self addSubview:titleView];
                }
            }
            
            UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, maxUnstretchTitleHeight - titleHeight)];
            contentView.textContainerInset = style.content.insets;
            contentView.text = self.message;
            contentView.font = style.content.font;
            contentView.textColor = style.content.textColor;
            contentView.backgroundColor = style.content.backgroundColor;
            contentView.editable = NO;
            contentView.selectable = NO;
            contentView.scrollEnabled = YES;
            [self addSubview:contentView];
            
            [self setupButton];
        }
    }
    
    self.layer.cornerRadius = style.alertView.cornerRadius;
    if (self.layer.cornerRadius > 0) {
        self.clipsToBounds = YES;
    }
    
    self.center = newSuperview.center;
}

- (void)setupButton {
    if (self.buttonHeight > 0) {
        JCAlertStyle *style = self.style;;
        if (self.buttonItems.count > 1) {
            JCAlertButtonItem *leftItem = self.buttonItems[0];
            JCAlertStyleButton *styleButton = style.buttonNormal;
            if (leftItem.type == JCButtonTypeCancel) {
                styleButton = style.buttonCancel;
            } else if (leftItem.type == JCButtonTypeWarning) {
                styleButton = style.buttonWarning;
            }
            UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.buttonHeight, style.alertView.width / 2, self.buttonHeight)];
            [leftBtn setTitle:leftItem.title forState:UIControlStateNormal];
            [leftBtn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [leftBtn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [leftBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [leftBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            leftBtn.titleLabel.font = styleButton.font;
            [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:leftBtn];
            
            JCAlertButtonItem *rightItem = self.buttonItems[1];
            styleButton = style.buttonNormal;
            if (rightItem.type == JCButtonTypeCancel) {
                styleButton = style.buttonCancel;
            } else if (rightItem.type == JCButtonTypeWarning) {
                styleButton = style.buttonWarning;
            }
            UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(style.alertView.width / 2, self.frame.size.height - self.buttonHeight, style.alertView.width / 2, self.buttonHeight)];
            [rightBtn setTitle:rightItem.title forState:UIControlStateNormal];
            [rightBtn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [rightBtn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [rightBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [rightBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            rightBtn.titleLabel.font = styleButton.font;
            [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:rightBtn];
            
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.buttonHeight, style.alertView.width, style.separator.width)];
            separator.backgroundColor = style.separator.color;
            [self addSubview:separator];
            
            UIView *separator1 = [[UIView alloc] initWithFrame:CGRectMake(style.alertView.width / 2, self.frame.size.height - self.buttonHeight, style.separator.width, styleButton.height)];
            separator1.backgroundColor = style.separator.color;
            [self addSubview:separator1];
        } else {
            JCAlertButtonItem *item = self.buttonItems[0];
            JCAlertStyleButton *styleButton = style.buttonNormal;
            if (item.type == JCButtonTypeCancel) {
                styleButton = style.buttonCancel;
            } else if (item.type == JCButtonTypeWarning) {
                styleButton = style.buttonWarning;
            }
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.buttonHeight, style.alertView.width, self.buttonHeight)];
            [btn setTitle:item.title forState:UIControlStateNormal];
            [btn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [btn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [btn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            btn.titleLabel.font = styleButton.font;
            [btn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.buttonHeight, style.alertView.width, style.separator.width)];
            separator.backgroundColor = style.separator.color;
            [self addSubview:separator];
        }
    }
}

- (void)leftBtnClick {
    JCAlertButtonItem *item = self.buttonItems[0];
    [self notifyDelegateWithClicked:item.clicked];
}

- (void)rightBtnClick {
    JCAlertButtonItem *item = self.buttonItems[1];
    [self notifyDelegateWithClicked:item.clicked];
}

- (void)notifyDelegateWithClicked:(void(^)(void))clicked {
    if ([self.delegate respondsToSelector:@selector(alertButtonClicked:)]) {
        [self.delegate alertButtonClicked:clicked];
    }
}

@end
