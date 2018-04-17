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
@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *rightBtn;

@end

@implementation JCAlertView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.backgroundColor = [UIColor clearColor];
    
    JCAlertStyle *style = self.style;
    
    UIEdgeInsets titleInsets = style.title.insets;
    if (self.title && self.title.length > 0 && (!self.message || self.message.length == 0) && !self.contentView) {
        titleInsets = style.title.onlyTitleInsets;
    }
    
    UIEdgeInsets messageInsets = style.content.insets;
    if (self.message && self.message.length > 0 && (!self.title || self.title.length == 0)) {
        messageInsets = style.content.onlyMessageInsets;
    }
    
    // button height
    self.buttonHeight = self.buttonItems.count > 0 ? style.buttonNormal.height : 0;
    
    // cal title height
    CGFloat titleHeight = 0;
    CGSize titleSize = CGSizeZero;
    if (self.title.length > 0) {
        NSAttributedString *titleStr = [[NSAttributedString alloc] initWithString:self.title attributes:@{NSFontAttributeName:style.title.font}];
        titleSize = [titleStr sizeWithMaxWidth:style.alertView.width - titleInsets.left - titleInsets.right];
        titleHeight = titleSize.height + titleInsets.top + titleInsets.bottom;
    }
    
    // title one line height
    NSAttributedString *titleChar = [[NSAttributedString alloc] initWithString:@" " attributes:@{NSFontAttributeName:style.title.font}];
    CGFloat titleCharHeight = [titleChar sizeWithMaxWidth:self.frame.size.width].height;
    
    // if has contentView
    if (self.contentView) {
        CGFloat totalHeight = titleHeight + self.contentView.frame.size.height + self.buttonHeight;
        CGFloat alertHeight = totalHeight > self.style.alertView.maxHeight ? self.style.alertView.maxHeight : totalHeight;
        self.frame = CGRectMake(0, 0, style.alertView.width, alertHeight);
        
        if (titleHeight > 0) {
            if (titleSize.height <= titleCharHeight) { // show in center
                UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(titleInsets.left, titleInsets.top, style.alertView.width - titleInsets.left - titleInsets.right, titleCharHeight))];
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = [UIColor clearColor];
                titleView.textAlignment = style.title.textAlignment;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                bgView.backgroundColor = style.title.backgroundColor;
                [bgView addSubview:titleView];
                
                [self addSubview:bgView];
            } else { // break line use textview
                UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                titleView.textContainerInset = titleInsets;
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.editable = NO;
                titleView.selectable = NO;
                titleView.scrollEnabled = YES;
                titleView.textAlignment = style.title.textAlignment;
                // because contentsize.height < frame.size.height
                if (titleView.frame.size.height < titleView.contentSize.height) {
                    CGRect newF = titleView.frame;
                    newF.size.height = titleView.contentSize.height;
                    titleView.frame = newF;
                }
                titleView.scrollEnabled = NO;
                [self addSubview:titleView];
            }
        }
        
        CGRect contentFrame = self.contentView.frame;
        contentFrame.origin.y = titleHeight;
        
        CGFloat maxContentHeight = self.style.alertView.maxHeight - titleHeight - self.buttonHeight;
        if (CGRectGetHeight(contentFrame) > maxContentHeight) {
            CGRect scrollFrame = contentFrame;
            scrollFrame.size.height = maxContentHeight;
            UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
            contentScrollView.contentSize = contentFrame.size;
            contentScrollView.backgroundColor = self.style.alertView.backgroundColor;
            [contentScrollView addSubview:self.contentView];
            [self addSubview:contentScrollView];
        } else {
            self.contentView.frame = contentFrame;
            [self addSubview:self.contentView];
        }
        
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
        contentSize = [contentStr sizeWithMaxWidth:style.alertView.width - messageInsets.left - messageInsets.right];
        contentHeight = contentSize.height + messageInsets.top + messageInsets.bottom;
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
            if (titleSize.height <= titleCharHeight) { // show in center
                UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(titleInsets.left, titleInsets.top, style.alertView.width - titleInsets.left - titleInsets.right, titleCharHeight))];
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = [UIColor clearColor];
                titleView.textAlignment = style.title.textAlignment;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                bgView.backgroundColor = style.title.backgroundColor;
                [bgView addSubview:titleView];
                
                [self addSubview:bgView];
            } else {
                UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                titleView.text = self.title;
                titleView.font = style.title.font;
                titleView.textContainerInset = titleInsets;
                titleView.textColor = style.title.textColor;
                titleView.backgroundColor = style.title.backgroundColor;
                titleView.editable = NO;
                titleView.selectable = NO;
                titleView.scrollEnabled = YES;
                titleView.textAlignment = style.title.textAlignment;
                // because contentsize.height < frame.size.height
                if (titleView.frame.size.height < titleView.contentSize.height) {
                    CGRect newF = titleView.frame;
                    newF.size.height = titleView.contentSize.height;
                    titleView.frame = newF;
                }
                titleView.scrollEnabled = NO;
                [self addSubview:titleView];
            }
        }
        
        if (contentHeight > 0) {
            if (contentSize.height <= contentCharHeight) {
                UILabel *contentView = [[UILabel alloc] initWithFrame:CGRectMake(messageInsets.left, messageInsets.top, style.alertView.width - messageInsets.left - messageInsets.right, contentCharHeight)];
                contentView.text = self.message;
                contentView.font = style.content.font;
                contentView.textColor = style.content.textColor;
                contentView.backgroundColor = [UIColor clearColor];
                contentView.textAlignment = style.content.textAlignment;
                
                UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, contentHeight)];
                bgView.backgroundColor = style.content.backgroundColor;
                [bgView addSubview:contentView];
                
                [self addSubview:bgView];
            } else {
                UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, contentHeight)];
                contentView.textContainerInset = messageInsets;
                contentView.text = self.message;
                contentView.font = style.content.font;
                contentView.textColor = style.content.textColor;
                contentView.backgroundColor = style.content.backgroundColor;
                contentView.editable = NO;
                contentView.selectable = NO;
                contentView.scrollEnabled = YES;
                contentView.textAlignment = style.content.textAlignment;
                // because contentsize.height < frame.size.height
                if (contentView.frame.size.height < contentView.contentSize.height) {
                    CGRect newF = contentView.frame;
                    newF.size.height = contentView.contentSize.height;
                    contentView.frame = newF;
                }
                contentView.scrollEnabled = NO;
                [self addSubview:contentView];
            }
        }

        [self setupButton];
    } else {
        if (titleHeight > maxUnstretchTitleHeight) { // title scrollable
            UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, maxUnstretchTitleHeight)];
            titleView.textContainerInset = titleInsets;
            titleView.text = self.title;
            titleView.font = style.title.font;
            titleView.textColor = style.title.textColor;
            titleView.backgroundColor = style.title.backgroundColor;
            titleView.editable = NO;
            titleView.selectable = NO;
            titleView.textAlignment = style.title.textAlignment;
            [self addSubview:titleView];

            [self setupButton];
        } else { // content scrollable
            if (titleHeight > 0) {
                if (titleSize.height <= titleCharHeight) { // show in center
                    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(titleInsets.left, titleInsets.top, style.alertView.width - titleInsets.left - titleInsets.right, titleCharHeight))];
                    titleView.text = self.title;
                    titleView.font = style.title.font;
                    titleView.textColor = style.title.textColor;
                    titleView.backgroundColor = [UIColor clearColor];
                    titleView.textAlignment = style.title.textAlignment;
                    
                    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                    bgView.backgroundColor = style.title.backgroundColor;
                    [bgView addSubview:titleView];
                    
                    [self addSubview:bgView];
                } else { 
                    UITextView *titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, style.alertView.width, titleHeight)];
                    titleView.textContainerInset = titleInsets;
                    titleView.text = self.title;
                    titleView.font = style.title.font;
                    titleView.textColor = style.title.textColor;
                    titleView.backgroundColor = style.title.backgroundColor;
                    titleView.editable = NO;
                    titleView.selectable = NO;
                    titleView.scrollEnabled = YES;
                    titleView.textAlignment = style.title.textAlignment;
                    // because contentsize.height < frame.size.height
                    if (titleView.frame.size.height < titleView.contentSize.height) {
                        CGRect newF = titleView.frame;
                        newF.size.height = titleView.contentSize.height;
                        titleView.frame = newF;
                    }
                    titleView.scrollEnabled = NO;
                    [self addSubview:titleView];
                }
            }
            
            UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleHeight, style.alertView.width, maxUnstretchTitleHeight - titleHeight)];
            contentView.textContainerInset = messageInsets;
            contentView.text = self.message;
            contentView.font = style.content.font;
            contentView.textColor = style.content.textColor;
            contentView.backgroundColor = style.content.backgroundColor;
            contentView.editable = NO;
            contentView.selectable = NO;
            contentView.scrollEnabled = YES;
            contentView.textAlignment = style.content.textAlignment;
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
            CGFloat alertHeight = (self.frame.size.height > self.style.alertView.maxHeight) ? self.style.alertView.maxHeight : self.frame.size.height;
            UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, alertHeight - self.buttonHeight, style.alertView.width / 2, self.buttonHeight)];
            leftBtn.userInteractionEnabled = NO;
            [leftBtn setTitle:leftItem.title forState:UIControlStateNormal];
            [leftBtn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [leftBtn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [leftBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [leftBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            leftBtn.titleLabel.font = styleButton.font;
            [self addSubview:leftBtn];
            self.leftBtn = leftBtn;
            
            JCAlertButtonItem *rightItem = self.buttonItems[1];
            styleButton = style.buttonNormal;
            if (rightItem.type == JCButtonTypeCancel) {
                styleButton = style.buttonCancel;
            } else if (rightItem.type == JCButtonTypeWarning) {
                styleButton = style.buttonWarning;
            }
            UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(style.alertView.width / 2, alertHeight - self.buttonHeight, style.alertView.width / 2, self.buttonHeight)];
            rightBtn.userInteractionEnabled = NO;
            [rightBtn setTitle:rightItem.title forState:UIControlStateNormal];
            [rightBtn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [rightBtn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [rightBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [rightBtn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            rightBtn.titleLabel.font = styleButton.font;
            [self addSubview:rightBtn];
            self.rightBtn = rightBtn;
            
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
            CGFloat alertHeight = (self.frame.size.height > self.style.alertView.maxHeight) ? self.style.alertView.maxHeight : self.frame.size.height;
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, alertHeight - self.buttonHeight, style.alertView.width, self.buttonHeight)];
            btn.userInteractionEnabled = NO;
            [btn setTitle:item.title forState:UIControlStateNormal];
            [btn setTitleColor:styleButton.textColor forState:UIControlStateNormal];
            [btn setTitleColor:styleButton.highlightTextColor forState:UIControlStateHighlighted];
            [btn setBackgroundImage:[UIImage createImageWithColor:styleButton.backgroundColor] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage createImageWithColor:styleButton.highlightBackgroundColor] forState:UIControlStateHighlighted];
            btn.titleLabel.font = styleButton.font;
            [self addSubview:btn];
            self.leftBtn = btn;
            
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.buttonHeight, style.alertView.width, style.separator.width)];
            separator.backgroundColor = style.separator.color;
            [self addSubview:separator];
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint originPoint = [touch locationInView:self];
    
    [self handleTouch:originPoint insideLeft:^{
        self.leftBtn.highlighted = YES;
        self.rightBtn.highlighted = NO;
    } insideRight:^{
        self.rightBtn.highlighted = YES;
        self.leftBtn.highlighted = NO;
    } neither:^{
        self.rightBtn.highlighted = NO;
        self.leftBtn.highlighted = NO;
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint originPoint = [touch locationInView:self];
    
    [self handleTouch:originPoint insideLeft:^{
        [self leftBtnClick];
    } insideRight:^{
        [self rightBtnClick];
    } neither:nil];
}

- (void)handleTouch:(CGPoint)originPoint insideLeft:(void(^)(void))insideLeft insideRight:(void(^)(void))insideRight neither:(void(^)(void))neither {
    CGPoint point = [self convertPoint:originPoint toView:self.leftBtn];
    if (point.x > 0 && point.y > 0 && point.x <= self.leftBtn.frame.size.width && point.y <= self.leftBtn.frame.size.height) {
        insideLeft();
    } else {
        point = [self convertPoint:originPoint toView:self.rightBtn];
        if (point.x > 0 && point.y > 0 && point.x <= self.rightBtn.frame.size.width && point.y <= self.rightBtn.frame.size.height) {
            insideRight();
        } else {
            if (neither) {
                neither();
            }
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
