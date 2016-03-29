//
//  BVSContainerView.h
//  BVS_Lite
//
//  Created by 红枣 on 16/3/26.
//  Copyright © 2016年 normcore. All rights reserved.
//  这个是弹出来的输入框

#import <UIKit/UIKit.h>
@class BVSNormalInfoModel;

//label的字体
#define BVSNameFont [UIFont systemFontOfSize:18.0]
//text的字体
#define BVSTextFont [UIFont systemFontOfSize:14.0]

#define BVSMargin 10

@interface BVSContainerView : UIView

@property (nonatomic,strong) BVSNormalInfoModel* normalInfoModel;

@end
