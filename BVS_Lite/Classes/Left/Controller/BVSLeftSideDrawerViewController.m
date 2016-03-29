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
#import "BVSNormalInfoView.h"
#import "BVSNormalInfoModel.h"
#import "CustomIOSAlertView.h"
#import "BVSContainerView.h"
#import "BVSKeepingFrameView.h"
#import "BVSAuthorizeInfoViewController.h"

@interface BVSLeftSideDrawerViewController () <UITableViewDataSource,UITableViewDelegate,BVSNormalInfoViewDelegate,CustomIOSAlertViewDelegate>

@property (nonatomic, weak) BVSLeftSideDrawerTopView *topView;
@property (nonatomic, weak) UITableView *tableView;

/*
 * 左下部分的view
 */
@property (nonatomic, weak) UIView* leftInfoView;

/*
 * 一般信息
 */
@property (nonatomic,weak) BVSNormalInfoView *normalInfoView;

/**
 *  弹出框
 */
@property (nonatomic,weak) CustomIOSAlertView *alertView;

/**
 *  保存真设置
 */
@property(nonatomic,weak) BVSKeepingFrameView *keepingFrameView;

@end

@implementation BVSLeftSideDrawerViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self setRestorationIdentifier:@"BVSLeftSideDrawerController"];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBVSLeftBackgroundColor;
    
    [self setupBackground];
    [self setupNavigationBar];
    [self setupTopView];
    [self setupTableView];

    [self setupLeftInfoView];
    [self setupNormalInfo];
    [self setupKeepingFrame];
}

/**
 *  保存帧设置
 */
- (void)setupKeepingFrame{

    BVSKeepingFrameView *keepingFrameView = [[BVSKeepingFrameView alloc] initWithFrame:_leftInfoView.bounds];
    _keepingFrameView = keepingFrameView;
    [_leftInfoView addSubview:_keepingFrameView];

}

/**
 *  一般信息
 */
- (void)setupNormalInfo{

    _normalInfo = [[BVSNormalInfoModel alloc] init];
    _normalInfo.hospitalName = @"**医院";
    _normalInfo.departmentName = @"泌尿科";
    _normalInfo.operatorName = @"缺省操作员";

    BVSNormalInfoView *normalInfoView = [[BVSNormalInfoView alloc] initWithFrame:_leftInfoView.bounds];
    _normalInfoView = normalInfoView;
    normalInfoView.delegate = self;
    _normalInfoView.normalInfo = _normalInfo;
    [_leftInfoView addSubview:normalInfoView];

}

/*
 * 添加左下部分view
 */
- (void)setupLeftInfoView{

    CGFloat tableViewCellHeight = kBVSLeftViewCellCount*kBVSLeftViewCellHeight;
    CGFloat tableViewMaxY = CGRectGetMaxY(self.tableView.frame);
    CGFloat topViewMaxY = CGRectGetMaxY(self.topView.frame);
    CGFloat height = tableViewMaxY - tableViewCellHeight - topViewMaxY;
    UIView *leftInfoView = [[UIView alloc] initWithFrame:
                            CGRectMake(0,
                                       tableViewCellHeight,
                                       kBVSDrawerViewWidth,
                                       height)];
    _leftInfoView = leftInfoView;
    [self.tableView addSubview:_leftInfoView];
    
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

- (void)setupNavigationBar {
    UINavigationBar *bar = self.navigationController.navigationBar;
    bar.backgroundColor = [UIColor clearColor];
}

- (void)setupTopView {
    BVSLeftSideDrawerTopView *topView = [[BVSLeftSideDrawerTopView alloc] initWithFrame:CGRectMake(0, kBVSNavigationBarHeight, kBVSDrawerViewWidth, kBVSTopViewHeight)];
    _topView = topView;
    [self.view addSubview:topView];
    
    //  设置数据
    _topView.titleLabel.text = @"ver 1.0.0 2016-3-6";
}

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kBVSNavigationBarHeight+kBVSTopViewHeight, kBVSDrawerViewWidth, kBVSScreenHeight-kBVSNavigationBarHeight-_topView.bounds.size.height)];
    _tableView = tableView;
    [self.view addSubview:tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView setSeparatorColor:kBVSLeftSeparatorColor];
}

- (void)viewWillAppear:(BOOL)animated {
    
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

#pragma mark - tableviewdelagate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kBVSLeftViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            //一般信息
            _normalInfoView.hidden = NO;
            _keepingFrameView.hidden = YES;
            break;
        case 1:
            //保存帧设置

            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = NO;
            break;
        case 2:
            //矫正模式

            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = YES;
            break;
        case 3:
            //探头设置

            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = YES;
            break;
        case 4:
            //更新探头固件
            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = YES;
            break;
        case 5:
            //授权信息
            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = YES;

            break;

        case 6:
            //探头参数
            _normalInfoView.hidden = YES;
            _keepingFrameView.hidden = YES;
            break;

        default:
            break;
    }

    //跳转 授权信息
    if (indexPath.row == 5) {
        BVSAuthorizeInfoViewController *aim = [[BVSAuthorizeInfoViewController alloc] init];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:aim animated:YES completion:nil];
        });
    }

}

#pragma mark - BVSNormalInfoViewDelegate代理方法

- (void)normalInfoViewPopUpEditor{

    //弹出框自定义部分
    BVSContainerView *containerView = [[BVSContainerView alloc] initWithFrame:CGRectMake(0, 0, kBVSScreenWidth - kBVSTopViewHeight, kBVSScreenWidth/2)];
    containerView.normalInfoModel = _normalInfo;
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    alertView.containerView = containerView;
    alertView.delegate = self;
    _alertView = alertView;

    alertView.buttonTitles = @[@"确认",@"取消"];
    [alertView show];
}

#pragma mark -  CustomIOSAlertViewDelegate代理方法

- (void)customIOS7dialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if(buttonIndex == 0){//确认是更改数据

        CustomIOSAlertView *alert = (CustomIOSAlertView*)alertView;
        BVSContainerView* container = (BVSContainerView*)alert.containerView;
        _normalInfo = container.normalInfoModel;
        _normalInfoView.normalInfo = _normalInfo;
    }
    [alertView close];
}

#pragma mark - 键盘出现消失


- (void)keyboardWillShow: (NSNotification *)notification{

    CGRect rectKeyBoard = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat heightChange = (CGRectGetMaxY(_alertView.dialogView.frame) > rectKeyBoard.origin.y) ? (CGRectGetMaxY(_alertView.dialogView.frame) -rectKeyBoard.origin.y) : 0;
    CGRect alertViewRect = _alertView.dialogView.frame;
    alertViewRect.origin.y -= heightChange;
    _alertView.dialogView.frame = alertViewRect;
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
