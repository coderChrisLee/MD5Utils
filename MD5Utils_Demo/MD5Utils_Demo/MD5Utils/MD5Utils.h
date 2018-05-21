//
//  MD5Utils.h
//  eteamsfc
//
//  Created by Chris Lee on 2018/5/21.
//  Copyright © 2018年 泛微-eteams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Utils : NSObject

///使用OC系统方法 md5转换成hash字符串输出
+ (NSString *)md5ToHexWithOC:(NSString *)input;

///用C语言方法 将字符串转换为md5 hash字符串
+ (NSString *)md5ToHexWithC:(NSString *)input;

+ (NSMutableArray *)md5:(NSString *)input;

@end
