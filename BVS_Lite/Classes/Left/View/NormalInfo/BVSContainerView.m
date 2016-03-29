    //
//  BVSContainerView.m
//  BVS_Lite
//
//  Created by 红枣 on 16/3/26.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSContainerView.h"
#import "BVSNormalInfoModel.h"
#import "Masonry.h"

@interface BVSContainerView ()

@property (nonatomic,weak) UILabel *operatorLabel;
@property (nonatomic,weak) UITextField *operatorText;

@property (nonatomic,weak) UILabel *departmentLabel;
@property (nonatomic,weak) UITextField *departmentText;

@property (nonatomic,weak) UILabel *hospitalLabel;
@property (nonatomic,weak) UITextField *hospitalText;


@end


@implementation BVSContainerView

@synthesize normalInfoModel = _normalInfoModel;

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {

        [self setup];
    }
    return self;
}


#pragma mark - 设置控件

- (void)setup{

    //第一行
    UILabel *hospitalLabel = [[UILabel alloc] init];
    _hospitalLabel = hospitalLabel;
    [hospitalLabel setText:@"医院名称"];
    [self addSubview:hospitalLabel];

    UITextField *hospitalText = [[UITextField alloc] init];
    _hospitalText = hospitalText;
    [self addSubview:hospitalText];
    hospitalText.borderStyle = UITextBorderStyleRoundedRect;
    hospitalText.adjustsFontSizeToFitWidth = YES;

    //第二行
    UILabel * departmentLabel = [[UILabel alloc] init];
    _departmentLabel = departmentLabel;
    [departmentLabel setText:@"科室名称"];
    [self addSubview:departmentLabel];

    UITextField *departmentText = [[UITextField alloc] init];
    _departmentText = departmentText;
    [self addSubview:departmentText];
    departmentText.borderStyle = UITextBorderStyleRoundedRect;
    departmentText.adjustsFontSizeToFitWidth = YES;
    //第三行
    UILabel *operatorLabel = [[UILabel alloc] init];
    _operatorLabel = operatorLabel;
    [operatorLabel setText:@"操作者"];
    [self addSubview:operatorLabel];

    UITextField *operatorText = [[UITextField alloc] init];
    _operatorText = operatorText;
    [self addSubview:operatorText];
    operatorText.borderStyle = UITextBorderStyleRoundedRect;
    operatorText.adjustsFontSizeToFitWidth = YES;

}

#pragma mark - 更新约束

- (void)updateConstraints{

    //字体字典
    NSMutableDictionary *dictName = [NSMutableDictionary dictionary];
    dictName[NSFontAttributeName] = BVSNameFont;
    NSMutableDictionary *dictText = [NSMutableDictionary dictionary];
    dictText[NSFontAttributeName] = BVSTextFont;


    //不同行数的第一列的文字的宽度
    CGSize hospitalNameSize = [_hospitalLabel.text sizeWithAttributes:dictName];
    CGSize departmentNameSize = [_departmentLabel.text sizeWithAttributes:dictName];
    CGSize operatorNameSize = [_operatorLabel.text sizeWithAttributes:dictName];
    //最大的宽度,取出最大的宽度,使用
    CGFloat widthMax = (((hospitalNameSize.width > departmentNameSize.width) ? hospitalNameSize.width:departmentNameSize.width) > operatorNameSize.width)? ((hospitalNameSize.width > departmentNameSize.width) ? hospitalNameSize.width:departmentNameSize.width) : hospitalNameSize.width;

    CGFloat width = widthMax+BVSMargin*2;
    CGFloat height = hospitalNameSize.height+BVSMargin;

    CGFloat margin = (self.frame.size.height - height*3)/4;

    CGFloat widthTextField = self.frame.size.width - 2 * BVSMargin - width;

    //第一行
    [_hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(margin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    [_hospitalText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(margin);
        make.left.equalTo(_hospitalLabel.mas_right);
        make.width.equalTo(@(widthTextField));
        make.height.equalTo(@(height));
    }];

    //第二行
    [_departmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hospitalLabel.mas_bottom).offset(margin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    [_departmentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hospitalLabel.mas_bottom).offset(margin);
        make.left.equalTo(_departmentLabel.mas_right);
        make.width.equalTo(@(widthTextField));
        make.height.equalTo(@(height));
    }];

    //第三行
    [_operatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_departmentLabel.mas_bottom).offset(margin);
        make.left.equalTo(self).offset(BVSMargin);
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    [_operatorText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_departmentLabel.mas_bottom).offset(margin);
        make.left.equalTo(_operatorLabel.mas_right);
        make.width.equalTo(@(widthTextField));
        make.height.equalTo(@(height));
    }];


    [super updateConstraints];
}

- (void)layoutSubviews{

    [super layoutSubviews];

    [self updateConstraints];
}


#pragma mark - 退出键盘

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self endEditing:YES];
}

#pragma mark - getNormalInfo

- (BVSNormalInfoModel *)normalInfoModel{

    if (_normalInfoModel == nil) {
        _normalInfoModel = [[BVSNormalInfoModel alloc] init];
    }

    _normalInfoModel.hospitalName = (_hospitalText.text.length == 0)? @"缺省":_hospitalText.text;
    _normalInfoModel.departmentName = (_departmentText.text.length == 0)? @"缺省":_departmentText.text;
    _normalInfoModel.operatorName = (_operatorText.text.length == 0)? @"缺省":_operatorText.text;

    return _normalInfoModel;
}

- (void)setNormalInfoModel:(BVSNormalInfoModel *)normalInfoModel{

    _normalInfoModel = normalInfoModel;

    _hospitalText.text = _normalInfoModel.hospitalName;
     _departmentText.text = _normalInfoModel.departmentName;
     _operatorText.text = _normalInfoModel.operatorName;
}

@end
