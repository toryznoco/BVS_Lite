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


@interface BVSCenterViewController ()

@property (nonatomic, strong) UIView *topView;

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
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(90);
    }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
