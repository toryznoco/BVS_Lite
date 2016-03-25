//
//  BVSInputView.h
//  BVS_Lite
//
//  Created by Tory on 16/3/24.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>

//  宽高
#define kBVSInputViewWidth 300
#define kBVSInputViewLabelWidth 100
#define kBVSInputViewInputWidth (kBVSInputViewWidth-kBVSInputViewLabelWidth-2*kBVSInputViewLeftRightMargin)
#define kBVSInputViewRowHeight 100
#define kBVSInputViewTopBottomMargin 8
#define kBVSInputViewLeftRightMargin 10
#define kBVSInputViewInterval 5

//  字体
#define kBVSInputViewFontSize 15

@interface BVSInputView : UIAlertView

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


@end
