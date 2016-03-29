//
//  BVSNormalInfoModel.h
//  BVS_Lite
//
//  Created by 红枣 on 16/3/25.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BVSNormalInfoModel : NSObject

/**
 *  医院名称
 */
@property (nonatomic, strong) NSString *hospitalName;

/**
 *  科室名称
 */
@property (nonatomic,strong) NSString *departmentName;

/**
 *  操作者
 */
@property (nonatomic,strong) NSString *operatorName;

@end
