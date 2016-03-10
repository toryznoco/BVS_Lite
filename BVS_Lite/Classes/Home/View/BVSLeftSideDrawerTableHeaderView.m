//
//  BVSLeftSideDrawerTableHeaderView.m
//  BVS_Lite
//
//  Created by Tory on 16/3/9.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSLeftSideDrawerTableHeaderView.h"
#import <Masonry.h>

@implementation BVSLeftSideDrawerTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:243.0/255.0
                                               green:243.0/255.0
                                                blue:243.0/255.0
                                               alpha:1.0];
        [self setupTitleLabel];
    }
    return self;
}

- (void)setupTitleLabel {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRed:100.0/255.0
                                            green:100.0/255.0
                                             blue:100.0/255.0
                                            alpha:1.0];
    _titleLabel.text = @"ver 1.0.0 2016-3-6";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(30);
    }];
}

//- (void)updateConstraints {
//    
//    
//    [super updateConstraints];
//}

@end
