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
    if ([self length] > 0) {
        CGRect textRect = [self
                           boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                           options:(NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           context:nil];
        return CGSizeMake(ceilf(textRect.size.width), ceilf(textRect.size.height));
    } else {
        return CGSizeZero;
    }}

@end
