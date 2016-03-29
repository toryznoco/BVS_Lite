//
//  BVSKeepingBtnView.h
//  BVS_Lite
//
//  Created by 红枣 on 16/3/26.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BVSKeepingBtnView;

@protocol BVSKeepingBtnViewDelegate <NSObject>

- (void)keepingBtnVieClicked:(BVSKeepingBtnView*)keepingBtnView;

@end

#define BtnTag 10000


@interface BVSKeepingBtnView : UIView

@property (nonatomic,weak) id<BVSKeepingBtnViewDelegate> delegate;

@property (nonatomic,assign) BOOL keeped;

@end
