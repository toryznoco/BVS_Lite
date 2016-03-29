//
//  BVSNormalInfo.m
//  BVS_Lite
//
//  Created by 红枣 on 16/3/25.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSNormalInfoView.h"
#import "Masonry.h"
#import "BVSNormalInfoModel.h"

@interface BVSNormalInfoView ()

/**
 *  医院名称label
 */
@property (nonatomic, weak) UILabel *hospitalNameLabel;
/**
 *  医院名称text
 */
@property (nonatomic, weak) UILabel *hospitalNameText;
/**
 *  科室名称label
 */
@property (nonatomic, weak) UILabel *departmentNameLabel;
/**
 *  科室名称label
 */
@property (nonatomic, weak) UILabel *departmentNameText;
/**
 *  操作者名称label
 */
@property (nonatomic, weak) UILabel *operatorNameLabel;
/**
 *  操作者名称label
 */
@property (nonatomic, weak) UILabel *operatorNameText;

/**
 *  被点击的按钮
 */
@property (nonatomic,weak) UIButton *tapBtn;

@end

@implementation BVSNormalInfoView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        [self setupInfo];
        [self setupBtn];

        self.hidden = YES;
    }
    return self;
}

#pragma mark - 点击事件

- (void)tapBtnClicked:(UIButton*)btn {
    if ([self.delegate respondsToSelector:@selector(normalInfoViewPopUpEditor)]) {
        [self.delegate normalInfoViewPopUpEditor];
    }
}

#pragma mark - 初始化控件

- (void)setupBtn {

    UIButton *tapBtn = [[UIButton alloc] init];
    _tapBtn = tapBtn;
    [self addSubview:_tapBtn];
    [_tapBtn addTarget:self action:@selector(tapBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _tapBtn.frame = self.bounds;
}


/**
 *  设置信息控件
 */
- (void)setupInfo {

    UILabel * hospitalNameLabel = [[UILabel alloc] init];
    _hospitalNameLabel = hospitalNameLabel;
    [self addSubview:hospitalNameLabel];
    [hospitalNameLabel setText:@"医院名称"];
    hospitalNameLabel.font = BVSNameFont;

    UILabel * hospitalNameText = [[UILabel alloc] init];
    _hospitalNameText = hospitalNameText;
    [self addSubview:hospitalNameText];
    hospitalNameText.font = BVSTextFont;
    hospitalNameText.adjustsFontSizeToFitWidth = YES;

    UILabel * departmentNameLabel = [[UILabel alloc] init];
    _departmentNameLabel = departmentNameLabel;
    [self addSubview:departmentNameLabel];
    [departmentNameLabel setText:@"科室名称"];
    departmentNameLabel.font = BVSNameFont;

    UILabel * departmentNameText = [[UILabel alloc] init];
    _departmentNameText = departmentNameText;
    [self addSubview:departmentNameText];
    departmentNameText.font = BVSTextFont;
    departmentNameText.adjustsFontSizeToFitWidth = YES;

    UILabel * operatorNameLabel = [[UILabel alloc] init];
    _operatorNameLabel = operatorNameLabel;
    [self addSubview:operatorNameLabel];
    [operatorNameLabel setText:@"操作者"];
    operatorNameLabel.font = BVSNameFont;

    UILabel * operatorNameText = [[UILabel alloc] init];
    _operatorNameText = operatorNameText;
    [self addSubview:operatorNameText];
    operatorNameText.font = BVSTextFont;
    operatorNameText.adjustsFontSizeToFitWidth = YES;


}

#pragma mark - 设置模型

- (void)setNormalInfo:(BVSNormalInfoModel *)normalInfo {

    _normalInfo = normalInfo;

    [_hospitalNameText setText:normalInfo.hospitalName];
    [_departmentNameText setText:normalInfo.departmentName];
    [_operatorNameText setText:normalInfo.operatorName];

}

#pragma mark -更新约束

- (void)updateConstraints {

    //字体字典
    NSMutableDictionary *dictName = [NSMutableDictionary dictionary];
    dictName[NSFontAttributeName] = BVSNameFont;
    NSMutableDictionary *dictText = [NSMutableDictionary dictionary];
    dictText[NSFontAttributeName] = BVSTextFont;

    //不同行数的第一列的文字的宽度
    CGSize hospitalNameSize = [_hospitalNameLabel.text sizeWithAttributes:dictName];
    CGSize departmentNameSize = [_departmentNameLabel.text sizeWithAttributes:dictName];
    CGSize operatorNameSize = [_operatorNameLabel.text sizeWithAttributes:dictName];
    //最大的宽度,取出最大的宽度,使用
    CGFloat widthMax = (((hospitalNameSize.width > departmentNameSize.width) ? hospitalNameSize.width:departmentNameSize.width) > operatorNameSize.width)? ((hospitalNameSize.width > departmentNameSize.width) ? hospitalNameSize.width:departmentNameSize.width) : hospitalNameSize.width;
    CGFloat width = self.frame.size.width - BVSMargin*2 - widthMax;

    //第一行
    [_hospitalNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(BVSMargin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(widthMax+BVSMargin*2));
        make.height.equalTo(@(hospitalNameSize.height+BVSMargin));
    }];
    CGSize hospitalTextSize = [_hospitalNameText.text sizeWithAttributes:dictText];
    [_hospitalNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_hospitalNameLabel.mas_centerY);
        make.left.equalTo(_hospitalNameLabel.mas_right).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(hospitalTextSize.height+BVSMargin));
    }];

    //第二行
    [_departmentNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hospitalNameLabel.mas_bottom).offset(BVSMargin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(widthMax+BVSMargin*2));
        make.height.equalTo(@(departmentNameSize.height+BVSMargin));
    }];
    CGSize departmentTextSize = [_departmentNameText.text sizeWithAttributes:dictText];
    [_departmentNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_departmentNameLabel.mas_centerY);
        make.left.equalTo(_departmentNameLabel.mas_right).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(departmentTextSize.height+BVSMargin));
    }];

    //第三行
    [_operatorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_departmentNameLabel.mas_bottom).offset(BVSMargin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(widthMax+BVSMargin*2));
        make.height.equalTo(@(operatorNameSize.height+BVSMargin));
    }];
    CGSize operatorTextSize = [_operatorNameText.text sizeWithAttributes:dictText];
    [_operatorNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_operatorNameLabel.mas_centerY);
        make.left.equalTo(_operatorNameLabel.mas_right).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(operatorTextSize.height+BVSMargin));
    }];

    [super updateConstraints];
}




@end
