//
//  BVSNormalInfo.h
//  BVS_Lite
//
//  Created by 红枣 on 16/3/25.
//  Copyright © 2016年 normcore. All rights reserved.
//  这个是显示一般信息的

#import <UIKit/UIKit.h>
@class BVSNormalInfoModel;

@protocol BVSNormalInfoViewDelegate <NSObject>

/**
 *  弹出编辑器
 */
- (void)normalInfoViewPopUpEditor;

@end

@interface BVSNormalInfoView : UIView

//label的字体
#define BVSNameFont [UIFont systemFontOfSize:18.0]
//text的字体
#define BVSTextFont [UIFont systemFontOfSize:14.0]

#define BVSMargin 10

@property (nonatomic,strong) BVSNormalInfoModel* normalInfo;

@property (nonatomic,weak) id<BVSNormalInfoViewDelegate> delegate;

@end
