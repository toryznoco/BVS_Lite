//
//  BVSLeftSideDrawerViewController.m
//  BVS_Lite
//
//  Created by Tory on 16/3/10.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSLeftSideDrawerViewController.h"
#import "BVSLeftSideDrawerTopView.h"
#import <Masonry.h>

@interface BVSLeftSideDrawerViewController () <UITableViewDataSource>

@property (nonatomic, strong) BVSLeftSideDrawerTopView *topView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BVSLeftSideDrawerViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self setRestorationIdentifier:@"BVSLeftSideDrawerController"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBVSLeftBackgroundColor;
    
    [self setupBackground];
    [self setupTopView];
    [self setupTableView];
    [self setupNavigationBar];
}

- (void)setupBackground {
    //  背景背板
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, kBVSNavigationBarHeight+kBVSTopViewHeight, kBVSDrawerViewWidth, kBVSScreenHeight-kBVSNavigationBarHeight-kBVSTopViewHeight)];
    backgroundView.backgroundColor = kBVSThemeColor;
    [self.view addSubview:backgroundView];
    
    //  顶部图案
    UIImage *pattern_up = [UIImage imageNamed:@"polygon_up"];
    UIImageView *upPatternView = [[UIImageView alloc] initWithImage:pattern_up];
    upPatternView.frame = CGRectMake(0, kBVSNavigationBarHeight, upPatternView.frame.size.width, upPatternView.frame.size.height);
    [self.view addSubview:upPatternView];
    
    //  底部图案
    UIImage *pattern_down = [UIImage imageNamed:@"polygon_down"];
    UIImageView *bottomPatternView = [[UIImageView alloc] initWithImage:pattern_down];
    bottomPatternView.frame = CGRectMake((kBVSDrawerViewWidth-bottomPatternView.frame.size.width), (kBVSScreenHeight-bottomPatternView.frame.size.height), bottomPatternView.frame.size.width, bottomPatternView.frame.size.height);
    [self.view addSubview:bottomPatternView];
}

- (void)setupTopView {
    _topView = [[BVSLeftSideDrawerTopView alloc] initWithFrame:CGRectMake(0, kBVSNavigationBarHeight, kBVSDrawerViewWidth, kBVSTopViewHeight)];
    [self.view addSubview:_topView];
    
    //  设置数据
    _topView.titleLabel.text = @"ver 1.0.0 2016-3-6";
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kBVSNavigationBarHeight+kBVSTopViewHeight, kBVSDrawerViewWidth, kBVSScreenHeight-kBVSNavigationBarHeight-_topView.bounds.size.height)];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView setSeparatorColor:kBVSLeftSeparatorColor];
}

- (void)setupNavigationBar {
    UINavigationBar *bar = self.navigationController.navigationBar;
    bar.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated{
    
    // Called when the view is about to made visible. Default does nothing
    [super viewWillAppear:animated];
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
    //去除导航栏下方的横线
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"LeftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:@"tag"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"一般信息";
            break;
        case 1:
            cell.textLabel.text = @"保存帧设置";
            break;
        case 2:
            cell.textLabel.text = @"校正模式";
            break;
        case 3:
            cell.textLabel.text = @"探头设置";
            break;
        case 4:
            cell.textLabel.text = @"更新探头固件";
            break;
        case 5:
            cell.textLabel.text = @"授权信息";
            break;
        case 6:
            cell.textLabel.text = @"探头参数";
            break;
        default:
            break;
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
