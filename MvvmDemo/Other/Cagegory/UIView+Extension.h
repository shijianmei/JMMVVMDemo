//
//  UIView+extension.h
//  UCARTest
//
//  Created by 闫子阳 on 16/4/1.
//  Copyright © 2016年 闫子阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

// 设置maxX和maxY时必须首先设置width和height
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat changeWidth;
@property (nonatomic, assign) CGFloat changeHeight;

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

    // 设置阴影
- (UIView *)setShadowWithColor:(UIColor *)color size:(CGSize)size
                   borderColor:(UIColor *)borderColor;

- (UIView *)setBorderColor:(UIColor *)borderColor
                     width:(CGFloat)borderWidth;
- (UIView *) setCornerRadius:(CGFloat)cornerRadius;

- (UIView *) rotateWithAngle:(float) angle;

#pragma mark- 删除当前视图的所有子视图
- (void)removeAllSubviews;
#pragma mark- 获取当前视图的控制器
- (UIViewController*)viewController;
@end
