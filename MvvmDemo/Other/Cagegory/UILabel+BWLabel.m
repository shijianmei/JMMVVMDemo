//
//  UILabel+BWLabel.m
//  MMCBusiness
//
//  Created by 邱育良 on 2019/2/20.
//  Copyright © 2019 UCAR. All rights reserved.
//

#import "UILabel+BWLabel.h"

@implementation UILabel (BWLabel)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

+ (CGSize)sizeLabelWidth:(CGFloat)width
          attributedText:(NSAttributedString *)attributted {
    if(width<=0){
        return CGSizeZero;
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    lab.attributedText = attributted;
    lab.numberOfLines = 0;
    
    CGSize labSize = [lab sizeThatFits:lab.bounds.size];
    return labSize;
}
@end
