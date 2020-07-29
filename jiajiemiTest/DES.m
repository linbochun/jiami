//
//  DES.m
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/29.
//  Copyright © 2020 10.12. All rights reserved.
//

#import "DES.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
@implementation DES
#pragma mark - DES加密
const Byte iv[] = {1,2,3,4,5,6,7,8};


+(NSString*) encryptUseDES:(NSString*)plainText key:(NSString*)key

{
    NSData*data;
    NSString*ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesEncrypted =0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,kCCOptionPKCS7Padding| kCCOptionECBMode ,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [textData bytes], dataLength,
                                          buffer,1024,
                                          &numBytesEncrypted);
    if(cryptStatus ==kCCSuccess) {
        data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        //加密后的data转换成64位，解密的时候需要用initWithBase64EncodedString方法转为data
        ciphertext = [data base64EncodedStringWithOptions:0];
    }
    return ciphertext;
    
}
+(NSString*)decryptUseDES:(NSString*)cipherdata key:(NSString*)key

{
    //加密后的data转换成64位，解密的时候需要用initWithBase64EncodedString方法转为data
    NSData *data = [[NSData alloc] initWithBase64EncodedString:cipherdata options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString*plaintext =nil;
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesDecrypted =0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode ,
                                          [key UTF8String],kCCKeySizeDES,
                                          iv,
                                          [data bytes],
                                          [data length],
                                          buffer,1024,
                                          &numBytesDecrypted);
    if(cryptStatus ==kCCSuccess){
        NSData*plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
        
    }
    return plaintext;

}

+(NSString*) encryptUse3DES:(NSString*)plainText key:(NSString*)key

{
    NSData*data;
    NSString*ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesEncrypted =0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithm3DES,kCCOptionPKCS7Padding| kCCOptionECBMode ,
                                          [key UTF8String],
                                          kCCKeySize3DES,
                                          iv,
                                          [textData bytes], dataLength,
                                          buffer,1024,
                                          &numBytesEncrypted);
    if(cryptStatus ==kCCSuccess) {
        data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        //加密后的data转换成64位，解密的时候需要用initWithBase64EncodedString方法转为data
        ciphertext = [data base64EncodedStringWithOptions:0];
    }
    return ciphertext;
    
}
+(NSString*)decryptUse3DES:(NSString*)cipherdata key:(NSString*)key

{
    //加密后的data转换成64位，解密的时候需要用initWithBase64EncodedString方法转为data
    NSData *data = [[NSData alloc] initWithBase64EncodedString:cipherdata options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString*plaintext =nil;
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesDecrypted =0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithm3DES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode ,
                                          [key UTF8String],kCCKeySize3DES,
                                          iv,
                                          [data bytes],
                                          [data length],
                                          buffer,1024,
                                          &numBytesDecrypted);
    if(cryptStatus ==kCCSuccess){
        NSData*plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
        
    }
    return plaintext;

}
@end
