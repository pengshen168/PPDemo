//
//  MNBaseController.m
//  MONO
//
//  Created by 万启鹏 on 2018/9/14.
//  Copyright © 2018年 万启鹏. All rights reserved.
//

#import "MNBaseController.h"

@interface MNBaseController (){
    
    UIView *pageLoadingView;
    UIView *loadingView;
    UIImageView *loadingImageView;
    UILabel *loadingLabel;
    UIView *_failureHintView;
    UIButton *_leftBarButton;
    
}



@end

@implementation MNBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XRandomColor;
//    self.view.backgroundColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.91 alpha:1];
    self.navigationController.navigationBar.translucent = NO;

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XScreenW, XScreenH - NaviH - KTabBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
         _tableView.backgroundColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.91 alpha:1];
        
#ifdef  __IPHONE_11_0
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
#endif
        [self.view addSubview:_tableView];
    }
    return _tableView;
}




//显示正在加载背景动画
#pragma mark - 正在加载动画
-(void)showPageLoadingProgress{
    
    if (!pageLoadingView) {
        pageLoadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XScreenW, XScreenH - NaviH - KTabBarHeight)];
          pageLoadingView.backgroundColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.91 alpha:1];
        
    }
    [pageLoadingView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view addSubview:pageLoadingView];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 25, 25)];
    imageView.center = CGPointMake(pageLoadingView.width/2, pageLoadingView.height/2);
    [pageLoadingView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"head-mask-bg"];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    animation.values = values;
    animation.repeatCount = FLT_MAX;
    [imageView.layer addAnimation:animation forKey:nil];


}

/**
 *  当加载数据失败时，显示重新加载数据的页面
 *  仅仅适用于非自动布局页面，自动布局页面建议使用: showHintPageWhenLoadFailedWithReloadTarget:action:
 *
 *  @param target 接收消息的对象
 *  @param action 事件处理方法
 */
-(void)showPageLoadingFailedWithReloadTarget:(id)target action:(SEL)action{
    
    if (!pageLoadingView) {
        pageLoadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XScreenW, XScreenH - NaviH - KTabBarHeight)];
        pageLoadingView.backgroundColor = [UIColor colorWithRed:0.86 green:0.89 blue:0.91 alpha:1];
        
    }
    [pageLoadingView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view addSubview:pageLoadingView];
    
    
    UIButton *reloadImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reloadImageBtn.frame = CGRectMake(0, 0, 40, 40);
    reloadImageBtn.center = CGPointMake(pageLoadingView.width/2, pageLoadingView.height/2);
    [pageLoadingView addSubview:reloadImageBtn];
    [reloadImageBtn setImage:[UIImage imageNamed:@"refresh_btn"] forState:UIControlStateNormal];
    
    
    
    UIButton *reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reloadBtn.frame = CGRectMake(0, reloadImageBtn.bottomY + 20, 200, 30);
    reloadBtn.centerX = pageLoadingView.width/2;
    [pageLoadingView addSubview:reloadBtn];
    reloadBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [reloadBtn setTitleColor:[UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1] forState:UIControlStateNormal];
    [reloadBtn setTitle:@"加载失败,请点击重试" forState:UIControlStateNormal];
    
    
    if (target) {
        [reloadImageBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [reloadBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
 *  隐藏加载失败重新加载页面
 */
- (void)dismissHintPageWhenLoadFailed{
    
    if (_failureHintView.subviews != nil) {
        [_failureHintView removeFromSuperview];
    }
}


/**
 隐藏加载动画与失败页面
 */
- (void)endPageLoadingProgress{
    [pageLoadingView removeFromSuperview];
    [pageLoadingView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
}


/**
 *  添加导航栏左侧按钮
 *
 *  @param image  按钮图片
 *  @param target self
 *  @param action 按钮执行方法
 */
-(void)addNavigationBarLeftButtonItemWithInfo:(UIImage*)image target:(id)target action:(SEL)action
{
    _leftBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _leftBarButton.frame = CGRectMake(0, 0, 24, 24);
    [_leftBarButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [_leftBarButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:_leftBarButton];
    self.navigationItem.leftBarButtonItem = item;
}

@end
