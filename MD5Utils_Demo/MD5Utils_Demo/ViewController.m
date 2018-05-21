//
//  ViewController.m
//  MD5Utils_Demo
//
//  Created by Chris Lee on 2018/5/21.
//  Copyright © 2018年 Chris Lee. All rights reserved.
//

#import "ViewController.h"
#import "MD5Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //BASE64解码
//    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:json options:0];
//    NSString *base64Decoded = [[NSString alloc]
//      initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
//    NSLog(@"Decoded: %@", base64Decoded);
    
    //将字符串md5Hex加密，市面上这种md5加密方法比较多
    NSString *str1 = @"hello world";
    NSString *md5Json = [MD5Utils md5ToHexWithOC:str1];
    NSLog(@"md5JsonUseOC = %@",md5Json);
    NSLog(@"md5JsonUseC = %@",[MD5Utils md5ToHexWithC:str1]);

    //BASE64编码
    NSData *nsdata1 = [md5Json dataUsingEncoding:NSUTF8StringEncoding];
    NSString *baseJson1 = [nsdata1 base64EncodedStringWithOptions:0];
    NSLog(@"baseJson1 = %@",baseJson1);
    
    
    //使用[MD5Utils md5:str]方法加密字符串并转化为base64
    NSString *str2 = @"hello Chris";
    NSMutableArray *mutArray = [MD5Utils md5:str2];
    Byte bys[16];
    for (int i=0;i<mutArray.count;i++) {
        bys[i] = [mutArray[i] intValue];
    }
    //将md5加密后的byte[]数组格式如下
    //Byte bys[] = {93,65,64,42,-68,75,42,118,-71,113,-99,-111,16,23,-59,-110};
    
    //base64再编码
    NSData *nsdata2 = [[NSData alloc] initWithBytes:bys length:16];
    NSString *baseJson2 = [nsdata2 base64EncodedStringWithOptions:0];
    NSLog(@"baseJson2 = %@",baseJson2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
