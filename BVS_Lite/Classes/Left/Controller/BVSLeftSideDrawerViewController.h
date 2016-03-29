//
//  BVSLeftSideDrawerViewController.h
//  BVS_Lite
//
//  Created by Tory on 16/3/10.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BVSNormalInfoModel;

//  宽高
#define kBVSTopViewHeight 50
#define kBVSDrawerViewWidth 280


//  颜色
#define kBVSLeftSeparatorColor [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.4]
#define kBVSLeftBackgroundColor [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]

//cell数目
#define kBVSLeftViewCellCount 7
//cell高度
#define kBVSLeftViewCellHeight 44.0


@interface BVSLeftSideDrawerViewController : UIViewController

/**
 *  储存信息
 */
@property (nonatomic,strong) BVSNormalInfoModel *normalInfo;

@end
