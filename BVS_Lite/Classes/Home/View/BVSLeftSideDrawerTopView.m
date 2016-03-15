//
//  BVSLeftSideDrawerTopView.m
//  BVS_Lite
//
//  Created by Tory on 16/3/10.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSLeftSideDrawerTopView.h"
#import <Masonry.h>

@implementation BVSLeftSideDrawerTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTitleLabel];
    }
    return self;
}

- (void)setupTitleLabel {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = kBVSLeftSideTitleTextColor;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(30);
    }];
}

@end
