//
//  CommonFiles.h
//  PPDemo
//
//  Created by 万启鹏 on 2018/10/30.
//  Copyright © 2018 万启鹏. All rights reserved.
//

#ifndef CommonFiles_h
#define CommonFiles_h




#define APPDELEGATE   (AppDelegate *)[UIApplication sharedApplication].delegate

#define XWeakSelf(type) __weak typeof(type) weak##type = type

#define XNotificationCenter [NSNotificationCenter defaultCenter]

#define XUserDefaults [NSUserDefaults standardUserDefaults]


#define Domain                          @"api.ougohome.com"
#define BASEURL                         @"http://api.ougohome.com/index.php/"


#define BaseUrl @"http://mmmono.com/api/v3/"
#define DiscoveryNextNewRecommend   BaseURL@"/discover/nextNewRecommend"


#define IsNil(__X__) [(__X__)isEqual:[NSNull null]] || (__X__) == nil ? YES:NO
#define checkNull(__X__) [(__X__)isEqual:[NSNull null]] || (__X__) == nil ? @"" : [NSString stringWithFormat:@"%@", (__X__)]


#define XScreenW [UIScreen mainScreen].bounds.size.width
#define XScreenH [UIScreen mainScreen].bounds.size.height

//目前iPhoneX都是刘海屏，状态栏的高度均为44pt，故：
#define isIPhoneXAll ([[UIApplication sharedApplication] statusBarFrame].size.height == 44)

//iPhoneX系列
#define XHeight_StatusBar ((isIPhoneXAll == YES) ? 44.0 : 20.0)
#define XHeight_NavBar ((isIPhoneXAll == YES) ? 88.0 : 64.0)
#define XHeight_TabBar ((isIPhoneXAll == YES) ? 83.0 : 49.0)
#define XHeight_Content   (XScreenH - XHeight_TabBar - XHeight_NavBar)

#define XScaleHeight(height) XScreenH/1334*height
#define XScaleWidth(width) XScreenW/750*width

#define XFont(fontSize) [UIFont systemFontOfSize:XScaleWidth(fontSize)]

#define XColor(text) [UIColor colorWithHexString:text]

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS11 ([[UIDevice currentDevice].systemVersion intValue] >= 11 ? YES : NO)
#define SCREEN_HEIGHT     ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH      ([[UIScreen mainScreen] bounds].size.width)
#define WEAKSELF __weak typeof(&*self) weakSelf = self;
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer］
#define LIGHTFONT(F) [UIFont systemFontOfSize:F weight:UIFontWeightLight]
#define REGULARFONT(F) [UIFont systemFontOfSize:F weight:UIFontWeightRegular]
#define THINFONT(F) [UIFont systemFontOfSize:F weight:UIFontWeightThin]


#define KStatusBarHeight (iPhoneX ? 24.f:0.f)
#define KStatusBarMargin (iPhoneX ? 22.f:0.f)
#define KTabBarHeight    (iPhoneX ? 83.f:49.f)

#define pageMenuH 40
#define NaviH (SCREEN_HEIGHT == 812 ? 88 : 64) // 812是iPhoneX的高度
#define KWaterSpace     3.0
#define KMarginLeft     12.0
#define KMarginRight    12.0


//设置 view 圆角和边框
#define XBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//颜色
#define RGB(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define XRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0]




////当前窗口
#define kCUREENT_WINDOW [[UIApplication sharedApplication] keyWindow]

#pragma mark - 打印宏
#ifdef __OBJC__

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

//打印函数
#define  XLogFunc NSLog(@"%s", __func__)

#ifdef DEBUG
#define XLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define XLog(format, ...)
#endif


#define XPushVC(_viewController){ _viewController *vc = [[_viewController alloc]init];[self.navigationController pushViewController:vc animated:YES];}

#define XShowAlert(_msg){UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定",nil];[alert show];}


// 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;




#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]





#endif

#endif /* CommonFiles_h */
