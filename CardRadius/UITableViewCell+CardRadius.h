//
//  UITableViewCell+CardRadius.h
//  CardRadius
//
//  Created by le tong on 2019/2/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (CardRadius)
- (void)insetCardViewWithCorners:(UIRectCorner)byRoundingCorners
                      edgeInsets:(UIEdgeInsets)edgeInsets
                          radius:(CGFloat)radius
                     borderWidth:(CGFloat)borderWidth
                    borderCorlor:(UIColor *)borderCorlor
                 backgroundColor:(UIColor *)backgroundColor;
@end

@interface CardRadiusImageViews : UIImageView
+ (UIImage *)drawRectWithRoundedCornerRadius:(CGFloat)radius
                                        size:(CGSize)size
                           byRoundingCorners:(UIRectCorner)byRoundingCorners
                                 borderWidth:(CGFloat)borderWidth
                             backgroundColor:(UIColor *)backgroundColor
                                borderCorlor:(UIColor *)borderColor;
@end

NS_ASSUME_NONNULL_END
