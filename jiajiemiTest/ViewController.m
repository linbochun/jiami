//
//  ViewController.m
//  jiajiemiTest
//
//  Created by 10.12 on 2020/7/28.
//  Copyright © 2020 10.12. All rights reserved.
//

#import "ViewController.h"
#import "RSA.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self RSA1];
}

/*
 公钥私钥由http://web.chacuo.net/netrsakeypair提供
 */
-(void)RSA1{
     //公钥
       NSString *publicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDaBP9guWQPO2jSbG1NHiWvwY9pti6B9sagVISpgXdio1amauYALYXwcgx6rybR7JfBbkmVS3Xw7yxy5WPpiVzmEwSh7xxviyot6yMeeZwhYVBdK2iOCWPATjIOsUvsb+Z6ydPFLO/Gf0CLVFScKy8UN+kzCNaor9DM/1P0hh8/+wIDAQAB";
       //私钥
       NSString *privateKey = @"MIICeQIBADANBgkqhkiG9w0BAQEFAASCAmMwggJfAgEAAoGBANoE/2C5ZA87aNJsbU0eJa/Bj2m2LoH2xqBUhKmBd2KjVqZq5gAthfByDHqvJtHsl8FuSZVLdfDvLHLlY+mJXOYTBKHvHG+LKi3rIx55nCFhUF0raI4JY8BOMg6xS+xv5nrJ08Us78Z/QItUVJwrLxQ36TMI1qiv0Mz/U/SGHz/7AgMBAAECgYEAvunza5LMkR4YC3PRPt+wZrjbydkz3rDnfEymovxxO9oGrdIcOHmkuUpVrTUljFxfA459NxQOYn4+cRp4pG+Z/W1RLWMOAk0M79Fw14CEJk9d2sJUa03As9shrxRMndqZASWEZgIGGaia6ZqfsR/OafkZGsGUDPVILSu3dzH5aPkCQQDufqq0roD629VzeZjdyrl+hTDKCCd0kujZ2SRNyGvGLr+8jVRlwX2I7C0kKhTa8WJB/RC173E616GlSFXc7gMvAkEA6gWZWry0C/5eZgoFt2MfYelyueQhG7gE42jYFzV3BbH8f4gB3PrsyS8SA212udxu5RiRkFjO4ZoMzOBlKNAM9QJBALmCe4P5bMg0cQ7WWarDgo/ASFgOCaqqj0bMmWmLaRGJ0Yh3oltYKy5zDxXfScOYGObdUr9B1aCAk/K9llQ4Ku8CQQCRXJD5L6WWnZX9Q9RxKPzhUKSWmwGFujQvHXy8TdV0kC4K+WxO2v4hqT9DKcdJg4bOfwhL5R38PDgfOnMber/RAkEA2mW2Q8VN7OQXWjRJPngOd62GQI5R7jC9uSi/w8oh6mB02spKOo6XBa9xcBHlzLRhqEJIKYAw3i//hCYG3neoHQ==";
       //测试要加密的数据
       NSString *sourceStr = @"iOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSASAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSAiOS端RSA";
       //公钥加密
       NSString *encryptStr = [RSA encryptString:sourceStr publicKey:publicKey];
       //私钥解密
       NSString *decrypeStr = [RSA decryptString:encryptStr privateKey:privateKey];
       NSLog(@"加密后的数据 %@ 解密后的数据 %@",encryptStr,decrypeStr);
        
}

@end
