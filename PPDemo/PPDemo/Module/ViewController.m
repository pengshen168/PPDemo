//
//  ViewController.m
//  PPDemo
//
//  Created by 万启鹏 on 2018/10/30.
//  Copyright © 2018 万启鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *lab = [UILabel labelWithTitle:@"ehfjk" font:XFont(24) textColor:XRandomColor backgroundColor:XRandomColor Frame:CGRectMake(50, 50, 200, 60)];
    [lab changeAlignmentLeftAndRight];
    [self.view addSubview:lab];
    
}


@end
