//
//  NSAttributedString+JCCalculateSize.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/5.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "NSAttributedString+JCCalculateSize.h"

@implementation NSAttributedString (JCCalculateSize)

- (CGSize)sizeWithMaxWidth:(CGFloat)maxWidth {
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(maxWidth, FLT_MAX)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager glyphRangeForTextContainer:textContainer];
    CGSize fitSize = [layoutManager usedRectForTextContainer:textContainer].size;
    return fitSize;
}

@end
