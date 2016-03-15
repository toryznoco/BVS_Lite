//
//  BVSHomeTopView.m
//  BVS_Lite
//
//  Created by Tory on 16/3/6.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSHomeTopView.h"
#import <Masonry.h>

@interface BVSHomeTopView ()

@property (nonatomic, strong) UIView *separator;

@end

@implementation BVSHomeTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpAllChildView];
    }
    return self;
}

- (void)setUpAllChildView {
    //  id
    _idLabel = [[UILabel alloc] init];
    _idLabel.text = @"ID：1";
    _idLabel.font = [UIFont systemFontOfSize:kBVSTopViewFontSize];
    [self addSubview:_idLabel];
    
    //  生日
    _birthLabel = [[UILabel alloc] init];
    _birthLabel.text = @"生日：1990-01-01";
    _birthLabel.font = [UIFont systemFontOfSize:kBVSTopViewFontSize];
    [self addSubview:_birthLabel];
    
    //  姓名
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"姓名：张三";
    _nameLabel.font = [UIFont systemFontOfSize:kBVSTopViewFontSize];
    [self addSubview:_nameLabel];
    
    //  性别
    _genderLabel = [[UILabel alloc] init];
    _genderLabel.text = @"性别：男";
    _genderLabel.font = [UIFont systemFontOfSize:kBVSTopViewFontSize];
    [self addSubview:_genderLabel];
    
    //  分割线
    _separator = [[UIView alloc] init];
    [_separator setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:_separator];
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(kBVSLabelTopBottomMargin);
        make.left.equalTo(self.mas_left).with.offset(kBVSLabelLeftRightMargin);
        make.right.equalTo(self.mas_centerX).with.offset(-kBVSLabelInterval/2);
        make.bottom.equalTo(self.mas_centerY).with.offset(-kBVSLabelInterval/2);
    }];
    
    [_birthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_idLabel);
        make.left.equalTo(self.mas_centerX).with.offset(kBVSLabelInterval/2);
        make.right.equalTo(self.mas_right).with.offset(-kBVSLabelLeftRightMargin);
        make.bottom.equalTo(_idLabel);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_centerY).with.offset(kBVSLabelInterval/2);
        make.left.equalTo(_idLabel);
        make.right.equalTo(_idLabel);
        make.bottom.equalTo(self.mas_bottom).with.offset(-kBVSLabelTopBottomMargin);
    }];
    
    [_genderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel);
        make.left.equalTo(self.mas_centerX).with.offset(kBVSLabelInterval/2);
        make.right.equalTo(_birthLabel);
        make.bottom.equalTo(_nameLabel);
    }];
    
    [_separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(kBVSSeparatorHeight);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

@end
