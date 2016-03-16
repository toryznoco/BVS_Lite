//
//  BVSCenterViewController.m
//  BVS_Lite
//
//  Created by Tory on 16/3/3.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSCenterViewController.h"
#import "BVSHomeTopView.h"
#import <Masonry.h>
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>
#import <AsyncSocket.h>


@interface BVSCenterViewController () <AsyncSocketDelegate>

@property (nonatomic, strong) BVSHomeTopView *topView;

@end

@implementation BVSCenterViewController

- (instancetype)init {
    if (self = [super init]) {
        [self setRestorationIdentifier:@"BVSCenterControllerRestorationKey"];
        _topView = [[BVSHomeTopView alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    [self setupTopView];
    
    AsyncSocket *socket = [[AsyncSocket alloc] initWithDelegate:self];
    [socket connectToHost:@"www.baidu.com" onPort:80 error:nil];
    
    [socket writeData:[@"GET /HTTP/1.1\n\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:3 tag:1];
    [socket readDataWithTimeout:3 tag:1];
    
}

- (void)setupLeftMenuButton {
    UIBarButtonItem *leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStyleBordered target:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

- (void)setupRightMenuButton {
    UIBarButtonItem *rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"profile"] style:UIBarButtonItemStylePlain target:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

- (void)setupTopView {
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(kBVSNavigationBarHeight);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(kBVSCenterTopViewHeight);
    }];
    
    //  设置数据
    _topView.idLabel.text = @"ID：1";
    _topView.birthLabel.text = @"生日：1990-01-01";
    _topView.nameLabel.text = @"姓名：张三";
    _topView.genderLabel.text = @"性别：男";
}

#pragma mark - Button Handlers
- (void)leftDrawerButtonPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)rightDrawerButtonPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"did connect to host");
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSLog(@"did read data");
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"message is: \n%@",message);
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
