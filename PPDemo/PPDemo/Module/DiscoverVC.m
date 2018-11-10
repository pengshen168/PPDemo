//
//  DiscoverVC.m
//  PPDemo
//
//  Created by 万启鹏 on 2018/10/30.
//  Copyright © 2018 万启鹏. All rights reserved.
//

#import "DiscoverVC.h"
#import "PPHistoryTableViewCell.h"

#import "UIImageView+WebCache.h"
@interface DiscoverVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dateArr;
@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHistoryTableView];
    [self getNetDate];
    
}

-(void)setupHistoryTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XScreenW, XScreenH) style:UITableViewStylePlain];
    self.myTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [self.myTableView registerNib:[UINib nibWithNibName:@"PPHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"history"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PPHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"history"];
    NSMutableDictionary *dict = self.dateArr[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:dict[@"thumbnail_url"]]];
    cell.yearLab.text = dict[@"year"];
    cell.contentLab.text = dict[@"title"];
    return cell;
}

-(void)getNetDate{
    
    [[MNNetworkTool shareService] requstWithUrl:@"http://api.shujuzhihui.cn/api/todayhistory/getTitle" Param:@{@"appKey":@"0295510a8f054b60badc4b34b332ae76"} Success:^(id responseObj) {
        NSLog(@"%@",responseObj);
        NSMutableDictionary *dict = responseObj;
        self.dateArr = dict[@"RESULT"];
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
