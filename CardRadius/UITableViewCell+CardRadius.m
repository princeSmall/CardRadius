

//
//  UITableViewCell+CardRadius.m
//  CardRadius
//
//  Created by le tong on 2019/2/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "UITableViewCell+CardRadius.h"
#import <Masonry.h>

@implementation UITableViewCell (CardRadius)
- (void)insetCardViewWithCorners:(UIRectCorner)byRoundingCorners
                      edgeInsets:(UIEdgeInsets)edgeInsets
                          radius:(CGFloat)radius
                     borderWidth:(CGFloat)borderWidth
                    borderCorlor:(UIColor *)borderCorlor
                 backgroundColor:(UIColor *)backgroundColor
{
    if ([self.contentView.subviews.firstObject isKindOfClass:[CardRadiusImageViews class]]) {
        return;
    }
    self.backgroundColor = [UIColor clearColor];
    CardRadiusImageViews *imgCornerRadiu = [[CardRadiusImageViews alloc] init];
    imgCornerRadiu.image = [CardRadiusImageViews drawRectWithRoundedCornerRadius:radius size:self.contentView.bounds.size byRoundingCorners:byRoundingCorners borderWidth:borderWidth backgroundColor:backgroundColor borderCorlor:borderCorlor];
    [self.contentView insertSubview:imgCornerRadiu atIndex:0];
    [imgCornerRadiu mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.insets(edgeInsets);
    }];
    
}
@end

@implementation CardRadiusImageViews
+ (UIImage *)drawRectWithRoundedCornerRadius:(CGFloat)radius
                                        size:(CGSize)size
                           byRoundingCorners:(UIRectCorner)byRoundingCorners
                                 borderWidth:(CGFloat)borderWidth
                             backgroundColor:(UIColor *)backgroundColor
                                borderCorlor:(UIColor *)borderColor
{
    
    // 绘制大小
    CGSize sizeToFit = size;
    backgroundColor = backgroundColor == nil ? [UIColor whiteColor] :backgroundColor;
    CGFloat halfBorderWidth = borderWidth / 2.0;
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGFloat width = sizeToFit.width, height = sizeToFit.height;
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);
    
    // 弧度
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, (byRoundingCorners & UIRectCornerBottomRight) ? radius : 0);
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, (byRoundingCorners & UIRectCornerBottomLeft) ? radius : 0);
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, (byRoundingCorners & UIRectCornerTopLeft) ? radius : 0);
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, (byRoundingCorners & UIRectCornerTopRight) ? radius : 0);
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
