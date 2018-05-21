# MD5Utils

A. 使用 OC 系统方法或者 C 语言，提供md5Hex: 方法将字符串通过md5 转换为hash 字符串输出；
/**
 * object-c语言:md5转换成hash字符串输出
 * 返回的是32位的md5 hash字符串(常用此方式)
 ＊ 对应java中的DigestUtils.md5Hex()
 */
+ (NSString *)md5ToHexWithOC:(NSString *)input；

/**
 * digest数据存储空间大小 返回的是32位的md5 hash字符串
 * c语言:将字符串转换为md5 hash字符串
 * 对应java中的DigestUtils.md5Hex(String)
 */
+ (NSString *)md5ToHexWithC:(NSString *)input;



B. 提供md5: 方法将字符串转换为md5 byte[]数组。
/**
 * digest数据存储空间大小
 * 将字符串转换为md5 byte[]数组，对应java中的DigestUtils.md5()
 * 返回16位长度的byte[]数组 淘宝的签名方式就是用base64(md5(NSString *))这样的方式，这样更安全。
 */
+ (NSMutableArray *)md5:(NSString *)input;
