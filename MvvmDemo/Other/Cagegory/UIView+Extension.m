//
//  UIView+extension.m
//  UCARTest
//
//  Created by 闫子阳 on 16/4/1.
//  Copyright © 2016年 闫子阳. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setMaxY:(CGFloat)maxY
{
    CGRect frame = self.frame;
    frame.origin.y = maxY - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)maxY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMaxX:(CGFloat)maxX
{
    CGFloat delta = maxX - (self.frame.origin.x + self.frame.size.width);
    CGRect frame = self.frame;
    frame.origin.x += delta ;
    self.frame = frame;
}

- (CGFloat)maxX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
        //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
        //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
        //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
        //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
        //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


- (UIView *)setShadowWithColor:(UIColor *)color size:(CGSize)size borderColor:(UIColor *)borderColor
{
    self.layer.borderWidth = 0.1f;
    self.layer.shadowColor = color.CGColor;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowOpacity = 0.6f;
    
    return self;
}

- (UIView *)setBorderColor:(UIColor *)borderColor
                     width:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    return self;
}

- (UIView *) setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds =YES;
    self.layer.cornerRadius = cornerRadius;
    
    return self;
}

- (void)setChangeWidth:(CGFloat)changeWidth
{
    CGRect frame = self.frame;
    frame.size.width = changeWidth;
    self.frame = frame;
}

- (CGFloat)changeWidth
{
    return self.frame.size.width;
}

- (void)setChangeHeight:(CGFloat)changeHeight
{
    CGRect frame = self.frame;
    frame.size.height = changeHeight;
    self.frame = frame;
}

- (CGFloat)changeHeight
{
    return self.frame.size.height;
}

//-(UIView *) rotateWithAngle:(float) angle
//{
//    if (![self respondsToSelector:@selector(layer)]) {
//        NSLog(@"This view(%@) don't have layer property. Can't rotate.", self);
//        return self;
//    }
//    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [UIView animateWithDuration:0.2 animations:^{
//        self.transform = CGAffineTransformRotate(self.transform, kRadianToDegrees(angle));
//    }];
//    
//    return self;
//}

#pragma mark- 删除当前视图的所有子视图
- (void)removeAllSubviews
{
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
#pragma mark- 获取当前视图的控制器
- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
