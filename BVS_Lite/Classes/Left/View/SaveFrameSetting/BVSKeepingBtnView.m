    //
//  ;
//  BVS_Lite
//
//  Created by 红枣 on 16/3/26.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSKeepingBtnView.h"
#import "Masonry.h"

@interface BVSKeepingBtnView ()

/**
 *  方向
 */
@property (nonatomic, weak) UILabel *directionLabel;
/**
*  按钮
*/
@property (nonatomic, weak) UIButton *selectBtn;



@end


@implementation BVSKeepingBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

#pragma mark - 添加控件
- (void)setup{

    UILabel *directionLabel = [[UILabel alloc] init];
    _directionLabel = directionLabel;
    directionLabel.backgroundColor = [UIColor redColor];
    [self addSubview:directionLabel];


    UIButton *selectBtn = [[UIButton alloc] init];
    _selectBtn = selectBtn;
     [self addSubview:selectBtn];
    [selectBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [selectBtn setImage:[UIImage imageNamed:@"title_confirm_normal"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"title_confirm_highlight"] forState:UIControlStateSelected];
}

#pragma mark - 设置按钮状态

- (void)setKeeped:(BOOL)keeped{

    _keeped = keeped;

    _selectBtn.selected = keeped;
}

#pragma mark - 监听按钮点击

- (void)selectBtnClicked:(UIButton*)btn{

    if ([self.delegate respondsToSelector:@selector(keepingBtnVieClicked:)]) {
        [self.delegate keepingBtnVieClicked:self];
    }

}



#pragma mark - 更新约束

- (void)updateConstraints{

    CGRect rect = self.frame;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat heightUsed = (width/2 > height)? height : width/2;

    [_directionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@((height-heightUsed)/2));
        make.width.equalTo(@(heightUsed));
        make.height.equalTo(@(heightUsed));
        make.left.equalTo(@(0));
    }];

    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@((height-heightUsed)/2));
        make.width.equalTo(@(heightUsed));
        make.height.equalTo(@(heightUsed));
        make.left.equalTo(@(heightUsed));
    }];


    [super updateConstraints];
}








@end
