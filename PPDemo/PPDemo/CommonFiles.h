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

#define IsNil(__X__) [(__X__)isEqual:[NSNull null]] || (__X__) == nil ? YES:NO
#define checkNull(__X__) [(__X__)isEqual:[NSNull null]] || (__X__) == nil ? @"" : [NSString stringWithFormat:@"%@", (__X__)]


#define XScreenW [UIScreen mainScreen].bounds.size.width
#define XScreenH [UIScreen mainScreen].bounds.size.height

#define XScaleHeight(height) XScreenH/1334*height
#define XScaleWidth(width) XScreenW/750*width

#define XFont(fontSize) [UIFont systemFontOfSize:XScaleWidth(fontSize)]

#define XColor(text) [UIColor colorWithHexString:text]

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


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



#define is_ios6  [[[UIDevice currentDevice]systemVersion] floatValue]<7

#define is_ios7  [[[UIDevice currentDevice]systemVersion] floatValue]>=7

#define is_ios8  [[[UIDevice currentDevice]systemVersion] floatValue]>=8

#define is_ios9 [[[UIDevice currentDevice] systemVersion] floatValue]>=9


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//判断屏幕是否为iPhone4
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_MAX_LENGTH (MAX(XScreenW, XScreenH))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

//iPhoneX机型判断
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define STNavigationBarAdapterContentInsetTop (IS_IPHONE_X? 88.0f:64.0f) //顶部偏移

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


#endif

#endif /* CommonFiles_h */
