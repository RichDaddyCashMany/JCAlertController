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
    CGRect brandRect = [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size = brandRect.size;
    NSString *height = [NSString stringWithFormat:@"%.0f", size.height];
    return CGSizeMake(size.width, height.floatValue);
}

@end
