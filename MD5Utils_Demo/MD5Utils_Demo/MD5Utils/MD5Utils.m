//
//  MD5Utils.m
//  eteamsfc
//
//  Created by Chris Lee on 2018/5/21.
//  Copyright © 2018年 Chris Lee. All rights reserved.
//

#import "MD5Utils.h"
#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Utils

/**
 * object-c语言:md5转换成hash字符串输出
 * 返回的是32位的md5 hash字符串(常用此方式)
 ＊ 对应java中的DigestUtils.md5Hex()
 */
+ (NSString *)md5ToHexWithOC:(NSString *)input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString string];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        NSLog(@"%d",digest[i]);
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}


/**
 * digest数据存储空间大小 返回的是32位的md5 hash字符串
 * c语言:将字符串转换为md5 hash字符串
 * 对应java中的DigestUtils.md5Hex(String)
 */
+ (NSString *)md5ToHexWithC:(NSString *)input {
    const char *cStr = [input UTF8String];
    MD5_CTX md5;
    MD5Init(&md5);
    int i;
    unsigned char *bys = (char *)cStr;
    unsigned char digest[16];
    MD5Update(&md5,bys,(int)strlen((char *)bys));
    MD5Final(&md5,digest);
    NSMutableString *output = [NSMutableString string];
    for(i=0;i<16;i++)
    {
        [output appendFormat:@"%02x", digest[i]];
        
    }
    return output;
}


/**
 * digest数据存储空间大小
 * 将字符串转换为md5 byte[]数组，对应java中的DigestUtils.md5()
 * 返回16位长度的byte[]数组 淘宝的签名方式就是用base64(md5(NSString *))这样的方式，这样更安全。
 */
+(NSMutableArray *)md5:(NSString *)input{
    const char *cStr = [input UTF8String];
    MD5_CTX md5;
    MD5Init(&md5);
    int i;
    char *bys = (char *)cStr;
    char digest[16];
    MD5Update(&md5,bys,(int)strlen((char *)bys));
    MD5Final(&md5,digest);
    NSMutableArray *mutArray = [NSMutableArray array];
    for(i=0;i<16;i++)
    {
        char ch = digest[i];
        NSString *str = [NSString stringWithFormat:@"%d",ch];
        [mutArray addObject:str];
    }
    return mutArray;
}
@end
