//
//  YFViewController.m
//  YFCommonView
//
//  Created by BigShow1949 on 06/16/2021.
//  Copyright (c) 2021 BigShow1949. All rights reserved.
//

#import "YFViewController.h"
#import <YFCommonView/YFSettingCell.h>

@interface YFViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<YFSettingCellGroupModel *> *dataSource;

@end

@implementation YFViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupData];
    [self setupUI];
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate  = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
}

- (void)setupData {
    self.dataSource = [NSMutableArray array];
    
    YFSettingCellGroupModel *groupModel1 = [[YFSettingCellGroupModel alloc] init];
    YFSettingCellModel *model = [YFSettingCellModel modelWithTitle:@"字体设置" controllerString:@""];
    model.img = [UIImage imageNamed:@"mine_info"];
    model.rightTitle = @"这是右边的标题";
    [groupModel1.modelArr addObject:model];
    [groupModel1.modelArr addObject:[YFSettingCellModel modelWithTitle:@"关于我们" controllerString:@""]];
    [groupModel1.modelArr addObject:[YFSettingCellModel modelWithTitle:@"检查更新" controllerString:@""]];
    [self.dataSource addObject:groupModel1];
    
    YFSettingCellGroupModel *groupModel2 = [[YFSettingCellGroupModel alloc] init];
    groupModel2.headTitle = @"协议说明";
    [groupModel2.modelArr addObject:[YFSettingCellModel modelWithTitle:@"《隐私政策》" titleColor:[UIColor blueColor] controllerString:@""]];
    [groupModel2.modelArr addObject:[YFSettingCellModel modelWithTitle:@"《用户协议》" titleColor:[UIColor blueColor] controllerString:@""]];
    [self.dataSource addObject:groupModel2];

    YFSettingCellGroupModel *groupModel3 = [[YFSettingCellGroupModel alloc] init];
    groupModel3.headTitle = @"账号设置";
    [groupModel3.modelArr addObject:[YFSettingCellModel modelWithTitle:@"修改密码" controllerString:@""]];
    [self.dataSource addObject:groupModel3];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YFSettingCell *cell = [YFSettingCell cellWithTableView:tableView];
    cell.model = self.dataSource[indexPath.section].modelArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) return nil;
    CGFloat padding = 16;
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(padding,0,header.frame.size.width-2*padding,5)];
    view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    [header addSubview:view];
    
    YFSettingCellGroupModel *groupModel = self.dataSource[section];
    CGFloat height = 24;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(padding, header.frame.size.height - height- 5, 120, height)];
    label.text = groupModel.headTitle;
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor blackColor];
    [header addSubview:label];

    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0 :60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"indexPath.row = %ld", (long)indexPath.row);
}
@end
