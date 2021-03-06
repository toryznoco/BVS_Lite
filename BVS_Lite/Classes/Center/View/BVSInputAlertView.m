//
//  BVSInputAlertView.m
//  BVS_Lite
//
//  Created by Tory on 16/3/24.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSInputAlertView.h"
#import <Masonry.h>

@interface BVSInputAlertView ()
/**
 *  生日
 */
@property (nonatomic, weak) UILabel *birthLabel;
/**
 *  姓名
 */
@property (nonatomic, weak) UILabel *nameLabel;
/**
 *  性别
 */
@property (nonatomic, weak) UILabel *genderLabel;
/**
 *  编号
 */
@property (nonatomic, weak) UILabel *numberLabel;

@end

@implementation BVSInputAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //  自己的属性
        self.backgroundColor = kBVSThemeColor;
        
        //  左边标题Label
        //  生日
        _birthLabel = [self createLabelWithFrame:CGRectMake(kBVSInputAlertViewLeftRightMargin, kBVSInputAlertViewTopBottomMargin, kBVSInputAlertViewLabelWidth, kBVSInputAlertViewRowHeight) name:@"生日"];
        
        //  姓名
        _nameLabel = [self createLabelWithFrame:CGRectMake(kBVSInputAlertViewLeftRightMargin, CGRectGetMaxY(_birthLabel.frame)+kBVSInputAlertViewInterval, kBVSInputAlertViewLabelWidth, kBVSInputAlertViewRowHeight) name:@"姓名"];
        
        //  性别
        _genderLabel = [self createLabelWithFrame:CGRectMake(kBVSInputAlertViewLeftRightMargin, CGRectGetMaxY(_nameLabel.frame)+kBVSInputAlertViewInterval, kBVSInputAlertViewLabelWidth, kBVSInputAlertViewRowHeight) name:@"性别"];
        
        //  编号
        _numberLabel = [self createLabelWithFrame:CGRectMake(kBVSInputAlertViewLeftRightMargin, CGRectGetMaxY(_genderLabel.frame)+kBVSInputAlertViewInterval, kBVSInputAlertViewLabelWidth, kBVSInputAlertViewRowHeight) name:@"编号"];
        
        // 右边输入框
        //  生日按钮(日期控件)
        UIButton *birthButton = [UIButton buttonWithType:UIButtonTypeSystem];
        birthButton.frame = CGRectMake(CGRectGetMaxX(_birthLabel.frame), _birthLabel.frame.origin.y, kBVSInputAlertViewInputWidth, kBVSInputAlertViewRowHeight);
        birthButton.titleLabel.text = @"1970-01-01";
        [self addSubview:birthButton];
        _birthButton = birthButton;
        
        //  姓名输入框
        _nameTextField = [self createTextFieldWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame), _nameLabel.frame.origin.y, kBVSInputAlertViewInputWidth, kBVSInputAlertViewRowHeight) placeholder:@"请输入受检者姓名"];
        
        //  性别按钮
        UIButton *genderButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_genderLabel.frame), _genderLabel.frame.origin.y, kBVSInputAlertViewInputWidth, kBVSInputAlertViewRowHeight)];
        genderButton.titleLabel.text = @"男";
        [self addSubview:genderButton];
        _genderButton = genderButton;
        
        //  编号输入框
        _numberTextField = [self createTextFieldWithFrame:CGRectMake(CGRectGetMaxX(_numberLabel.frame), _numberLabel.frame.origin.y, kBVSInputAlertViewInputWidth, kBVSInputAlertViewRowHeight) placeholder:@"请输入受检者编号"];
    }
    return self;
}

- (UILabel *)createLabelWithFrame:(CGRect)frame name:(NSString *)name {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor whiteColor];
    label.text = name;
    [self addSubview:label];
    return label;
}

- (UITextField *)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder{
    UITextField* textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor whiteColor];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:textField];
    return textField;
}

// Override父类的layoutSubviews方法
//- (void)layoutSubviews {
//    [super layoutSubviews];     // 当override父类的方法时，要注意一下是否需要调用父类的该方法
//    
//    for (UIView* view in self.subviews) {
//        // 搜索AlertView底部的按钮，然后将其位置下移
//        // IOS5以前按钮类是UIButton, IOS5里该按钮类是UIThreePartButton
//        if ([view isKindOfClass:[UIButton class]] ||
//            [view isKindOfClass:NSClassFromString(@"UIThreePartButton")]) {
//            CGRect btnBounds = view.frame;
//            btnBounds.origin.y = CGRectGetMaxY(_numberLabel.frame)+kBVSInputViewTopBottomMargin;
//            view.frame = btnBounds;
//        }
//    }
//    
//    // 定义AlertView的大小
//    CGRect bounds = self.frame;
//    bounds.size.height = kBVSInputViewWidth;
//    self.frame = bounds;
//}

- (void)show {
    
}

- (void)close {
    
}

@end
