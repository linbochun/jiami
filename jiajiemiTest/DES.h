//
//  DES.h
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/29.
//  Copyright © 2020 10.12. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DES : NSObject
/*DES,加密后的data转换成base64格式**/

+(NSString*) encryptUseDES:(NSString*)plainText key:(NSString*)key;
+(NSString*)decryptUseDES:(NSString*)cipherdata key:(NSString*)key;

+(NSString*)encryptUse3DES:(NSString*)plainText key:(NSString*)key;
+(NSString*)decryptUse3DES:(NSString*)cipherdata key:(NSString*)key;
@end

NS_ASSUME_NONNULL_END
