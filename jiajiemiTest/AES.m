//
//  AES.m
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/29.
//  Copyright © 2020 10.12. All rights reserved.
//

#import "AES.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

@implementation AES

#pragma mark - AES加密
+ (NSData *)AES128_Encrypt:(NSString *)key encryptData:(NSData *)data giv:(NSString *)gIv{

    
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    char ivPtr[kCCKeySizeAES128+1];
    bzero(ivPtr, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}
+(NSString *)AES128_Encrypt:(NSString *)key encryptString:(NSString *)encryptText giv:(NSString *)gIv{
    
    NSData *data = [encryptText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData * encryData = [self AES128_Encrypt:key encryptData:data giv:gIv];
    NSString *output = [encryData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return output;
}

//AES128解密data(带自定义向量)
+ (NSData *)AES128_Decrypt:(NSString *)key encryptData:(NSData *)data giv:(NSString *)gIv{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    bzero(ivPtr, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}
+ (NSString *)AES128_Decrypt:(NSString *)key encryptString:(NSString *)encryptText giv:(NSString *)gIv{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptText options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData * encryptData =  [self AES128_Decrypt:key encryptData:data giv:gIv];
    NSString *output = [[NSString alloc] initWithData:encryptData encoding:NSUTF8StringEncoding];
    return output;
}




@end
