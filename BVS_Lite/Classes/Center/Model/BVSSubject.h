//
//  BVSSubject.h
//  BVS_Lite
//
//  Created by Tory on 16/3/24.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BVSSubject : NSObject

/**
 *  生日
 */
@property (nonatomic, copy) NSString *birth;
/**
 *  姓名
 */
@property (nonatomic, copy) NSString *name;
/**
 *  性别
 */
@property (nonatomic, copy) NSString *gender;
/**
 *  编号
 */
@property (nonatomic, copy) NSString *number;

@end
