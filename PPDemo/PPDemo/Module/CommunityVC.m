//
//  DiscoverVC.m
//  PPDemo
//
//  Created by 万启鹏 on 2018/10/30.
//  Copyright © 2018 万启鹏. All rights reserved.
//

#import "CommunityVC.h"
#import "PPImgJokeTableViewCell.h"

#import "UIImageView+WebCache.h"
@interface CommunityVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dateArr;
@end

@implementation CommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHistoryTableView];
    [self getNetDate];
    
}

-(void)setupHistoryTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XScreenW, XHeight_Content) style:UITableViewStylePlain];
    self.myTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [self.myTableView registerNib:[UINib nibWithNibName:@"PPImgJokeTableViewCell" bundle:nil] forCellReuseIdentifier:@"imgJoke"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PPImgJokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgJoke"];
    NSMutableDictionary *dict = self.dateArr[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:dict[@"img_url"]]];
    cell.lab.text = dict[@"content"];
    
    return cell;
}

-(void)getNetDate{
    
    [[MNNetworkTool shareService] requstWithUrl:@"http://api.shujuzhihui.cn/api/joke/qiubai/img" Param:@{@"appKey":@"3310f47db8854d928861031c5ddb2f54"} Success:^(id responseObj) {
//        NSLog(@"%@",responseObj);
        NSMutableDictionary *dict = responseObj;
        self.dateArr = dict[@"RESULT"][@"imgs_joke"];
        [self.myTableView reloadData];
        
    }Failed:^(NSError * _Nonnull error) {
        
    }];
    
    
    
}

#pragma mark - 懒加载
- (NSMutableArray *)dateArr{
    if (!_dateArr) {
        _dateArr = [NSMutableArray   array];
    }
    return _dateArr;
}

@end
