//
//  BVSHomeTopView.h
//  BVS_Lite
//
//  Created by Tory on 16/3/6.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>

//  宽高
#define kBVSLabelTopBottomMargin 8
#define kBVSLabelLeftRightMargin 10
#define kBVSLabelInterval 6
#define kBVSSeparatorHeight 1

//  字体
#define kBVSTopViewFontSize 17      // 字体大小


@interface BVSHomeTopView : UIView

@property (nonatomic, strong) UILabel *idLabel;
@property (nonatomic, strong) UILabel *birthLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *genderLabel;

@end
