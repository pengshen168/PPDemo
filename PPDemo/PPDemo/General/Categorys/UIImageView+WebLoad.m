//
//  UIImageView+WebLoad.m
//  高仿MONO
//
//  Created by 万启鹏 on 2018/4/24.
//  Copyright © 2018年 万启鹏. All rights reserved.
//

#import "UIImageView+WebLoad.h"
#import <YYWebImage.h>

@implementation UIImageView (WebLoad)
-(void)setAvatarWithUrlString:(NSString *)urlString
{
    [self yy_setImageWithURL:[NSURL URLWithString:urlString] placeholder:[UIImage imageNamed:@""]];
}

-(void)setBrowseImageWithUrlString:(NSString *)urlString
{
    
//    [self yy_setImageWithURL:[NSURL URLWithString:urlString] placeholder:nil];
//    [self yy_setImageWithURL:[NSURL URLWithString:urlString] options:YYWebImageOptionProgressiveBlur｜YYWebImageOptionSetImageWithFadeAnimation];
//    [(YYAnimatedImageView *)self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"content-mask"]];
}

@end
