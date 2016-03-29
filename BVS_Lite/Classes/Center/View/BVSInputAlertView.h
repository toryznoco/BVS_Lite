//
//  BVSInputView.h
//  BVS_Lite
//
//  Created by Tory on 16/3/24.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>

//  宽高
#define kBVSInputAlertViewWidth 300
#define kBVSInputAlertViewLabelWidth 100
#define kBVSInputAlertViewInputWidth (kBVSInputAlertViewWidth-kBVSInputAlertViewLabelWidth-2*kBVSInputAlertViewLeftRightMargin)
#define kBVSInputAlertViewRowHeight 30
#define kBVSInputAlertViewTopBottomMargin 8
#define kBVSInputAlertViewLeftRightMargin 10
#define kBVSInputAlertViewInterval 5

//  字体
#define kBVSInputAlertViewFontSize 15

@interface BVSInputAlertView : UIView

/**
 *  生日
 */
@property (nonatomic, weak) UIButton *birthButton;
/**
 *  姓名
 */
@property (nonatomic, weak) UITextField *nameTextField;
/**
 *  性别
 */
@property (nonatomic, weak) UIButton *genderButton;
/**
 *  编号
 */
@property (nonatomic, weak) UITextField *numberTextField;

- (void)show;

- (void)close;

@end
