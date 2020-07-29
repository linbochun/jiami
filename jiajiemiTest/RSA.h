//
//  RSA.h
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/28.
//  Copyright © 2020 10.12. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 参考文章：https://www.jianshu.com/p/114f7a7ca60e
 文章的第二步那些地址邮件等信息我这边要填写才可以成功
 双向加密请看文章：https://blog.csdn.net/kangpengpeng1/article/details/79424414
 iOS RSA公钥和私钥的生成文章:https://www.jianshu.com/p/0fd94aad45a1
 */

@interface RSA : NSObject
/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
@end

NS_ASSUME_NONNULL_END
