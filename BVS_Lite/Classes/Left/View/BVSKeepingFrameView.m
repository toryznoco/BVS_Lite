//
//  BVSKeepingFrameView.m
//  BVS_Lite
//
//  Created by 红枣 on 16/3/26.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSKeepingFrameView.h"
#import "BVSKeepingBtnView.h"

@interface BVSKeepingFrameView () <BVSKeepingBtnViewDelegate>

/**
 *  被选择的按钮
 */
@property (nonatomic,strong) NSMutableArray *selectedBtns;

@end

@implementation BVSKeepingFrameView


- (NSMutableArray *)selectedBtns{
    if (_selectedBtns == nil) {
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;

        [self setup];
    }
    return self;
}

- (void)setup{

    int col = 4,row = 3;
    CGFloat height = self.frame.size.height/row;
    CGFloat width = self.frame.size.width/col;

    for (int index = 0; index < BVSIMageCount; index++) {

        BVSKeepingBtnView *keepingBtnView = [[BVSKeepingBtnView alloc] init];
        keepingBtnView.delegate = self;
        keepingBtnView.tag = BtnTag+index;
        [self addSubview:keepingBtnView];
        CGFloat X = 0 + index%col * width;
        CGFloat Y = 0 + index/col * height;
        keepingBtnView.frame = CGRectMake(X, Y, width, height);
    }
}

#pragma mark - BVSKeepingBtnViewDelegate代理方法

- (void)keepingBtnVieClicked:(BVSKeepingBtnView *)keepingBtnView{

    for (BVSKeepingBtnView *obj in self.selectedBtns) {
        if (obj.tag == keepingBtnView.tag){
            keepingBtnView.keeped = NO;
            [self.selectedBtns removeObject:keepingBtnView];
            return;
        }
    }

    if (self.selectedBtns.count < 3) {
        [self.selectedBtns addObject:keepingBtnView];
        keepingBtnView.keeped = YES;
        
    }else{
        BVSKeepingBtnView *btn = self.selectedBtns.lastObject;
        btn.keeped = NO;
        [self.selectedBtns removeLastObject];
        [self.selectedBtns addObject:keepingBtnView];
        keepingBtnView.keeped = YES;
    }

    BVSLog(@"第%ld个按钮被点击",keepingBtnView.tag - BtnTag + 1);
}

@end
