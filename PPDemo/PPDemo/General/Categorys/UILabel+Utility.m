//
//  UILabel+Utility.m
//  Biyouwoshi
//
//  Created by zjw on 15/7/8.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#import "UILabel+Utility.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Utility)

+ (UILabel *)labelWithTitle:(NSString *)Title
                       font:(UIFont *)nfont
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                      Frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text     = Title;
    label.textColor     = textColor;
    label.numberOfLines = 0;
    label.font            = nfont;
    label.backgroundColor = backgroundColor;
    return label;
}

/// label 已sizeToFit
+ (UILabel *)labelWithTitle:(NSString *)Title
                       font:(UIFont *)nfont
                  textColor:(UIColor *)textColor

{
    UILabel *label = [[UILabel alloc] init];
    label.text     = Title;
    label.textColor     = textColor;
    label.numberOfLines = 0;
    label.font          = nfont;
    [label sizeToFit];
    return label;
}


-(void)changeAlignmentLeftAndRight
{
    CGSize textsize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:self.font} context:nil].size;
    CGFloat margin = (self.frame.size.width - textsize.width) / self.text.length;
    NSNumber * number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributedString;
}


+ (UILabel *)labelWithTitle:(NSString *)Title
                       font:(UIFont *)nfont
                  textColor:(UIColor *)textColor
                  superView:(UIView *)superView{


    UILabel *label = [[UILabel alloc] init];
    label.text     = Title;
    label.textColor     = textColor;
    label.numberOfLines = 0;
    label.font         = nfont;
    [superView addSubview:label];
    return label;

}
+ (UILabel *)OneLinelabelWithTitle:(NSString *)Title
                              font:(UIFont *)nfont
                         textColor:(UIColor *)textColor
                         superView:(UIView *)superView{

    UILabel *label = [[UILabel alloc] init];
    label.text     = Title;
    label.textColor     = textColor;
    label.numberOfLines = 1;
    label.font         = nfont;
    [superView addSubview:label];
    return label;

}

@end
