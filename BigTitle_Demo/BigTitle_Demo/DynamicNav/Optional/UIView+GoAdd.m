//
//  UIView+GoAdd.m
//  dailylife
//
//  Created by gorry on 2016/11/21.
//  Copyright © 2016年 huofar. All rights reserved.
//

#import "UIView+GoAdd.h"

@implementation UIView (GoAdd)

#pragma mark - add method

- (void)setLayerShadow:(UIColor *)color
                offset:(CGSize)offset
                radius:(CGFloat)radius
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)removeAllSubviews
{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (UIViewController *)viewController
{
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

+ (UIView *)viewFromNib
{
//    NSString *className = NSStringFromClass([self class]);
//    NSArray *array = [[NSBundle mainBundle] loadNibNamed:className
//                                                   owner:nil
//                                                 options:nil];
//    if ([NSArray isTypeLegal:array] && array.count > 0) {
//        return array.firstObject;
//    }
    return nil;
}

+(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    if(viewController){
        return (viewController.isViewLoaded && viewController.view.window);
    }else{
        return NO;
    }
}

#pragma mark - UIViewGeometry

- (void)setHf_orgX:(CGFloat)hf_orgX
{
    CGRect frame = self.frame;
    frame.origin.x = hf_orgX;
    self.frame = frame;
}

- (CGFloat)hf_orgX
{
    return self.frame.origin.x;
}

- (void)setHf_orgY:(CGFloat)hf_orgY
{
    CGRect frame = self.frame;
    frame.origin.y = hf_orgY;
    self.frame = frame;
}

- (CGFloat)hf_orgY
{
    return self.frame.origin.y;
}

- (void)setHf_width:(CGFloat)hf_width
{
    CGRect frame = self.frame;
    frame.size.width = hf_width;
    self.frame = frame;
}

- (CGFloat)hf_width
{
    return self.frame.size.width;
}

- (void)setHf_height:(CGFloat)hf_height
{
    CGRect frame = self.frame;
    frame.size.height = hf_height;
    self.frame = frame;
}

- (CGFloat)hf_height
{
    return self.frame.size.height;
}

- (void)setHf_size:(CGSize)hf_size
{
    CGRect frame = self.frame;
    frame.size = hf_size;
    self.frame = frame;
}

- (CGSize)hf_size
{
    return self.frame.size;
}

- (void)setHf_origin:(CGPoint)hf_origin
{
    CGRect frame = self.frame;
    frame.origin = hf_origin;
    self.frame = frame;
}

- (CGPoint)hf_origin
{
    return self.frame.origin;
}

- (void)setHf_centerX:(CGFloat)hf_centerX
{
    CGPoint center = self.center;
    center.x = hf_centerX;
    self.center = center;
}

- (CGFloat)hf_centerX
{
    return self.center.x;
}

- (void)setHf_centerY:(CGFloat)hf_centerY
{
    CGPoint center = self.center;
    center.y = hf_centerY;
    self.center = center;
}

- (CGFloat)hf_centerY
{
    return self.center.y;
}

- (CGFloat)hf_bottom
{
    return self.hf_orgY + self.hf_height;
}

- (CGFloat)hf_right
{
    return self.hf_orgX + self.hf_width;
}

@end
