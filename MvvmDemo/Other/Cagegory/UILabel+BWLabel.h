//
//  UILabel+BWLabel.h
//  MMCBusiness
//
//  Created by 邱育良 on 2019/2/20.
//  Copyright © 2019 UCAR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (BWLabel)

/**
 label便利构造
 
 @param frame frame description
 @param text 文字
 @param font 字号
 @param textColor 文字颜色
 @param textAlignment 对齐方式
 @return label
 */
+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment;

/**
 计算符文本的size

 @param width 控件宽度
 @param attributted 富文本
 */
+ (CGSize)sizeLabelWidth:(CGFloat)width
          attributedText:(NSAttributedString *)attributted;

@end

NS_ASSUME_NONNULL_END
