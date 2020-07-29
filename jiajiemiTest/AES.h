//
//  AES.h
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/29.
//  Copyright © 2020 10.12. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*注：kCCKeySizeAES128点进去可以更换256位加密**/
@interface AES : NSObject
+(NSString *)AES128_Encrypt:(NSString *)key encryptString:(NSString *)encryptText giv:(NSString *)gIv;
+ (NSString *)AES128_Decrypt:(NSString *)key encryptString:(NSString *)encryptText giv:(NSString *)gIv;


@end

NS_ASSUME_NONNULL_END
