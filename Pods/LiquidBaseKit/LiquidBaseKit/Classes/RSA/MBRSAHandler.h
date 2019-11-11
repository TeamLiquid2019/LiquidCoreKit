//
//  MBRSAHandler.h
//  MotoBand
//
//  Created by 谭诚 on 2018/3/13.
//  Copyright © 2018年 MotoBand-Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

//Motoband
static NSString* service_public_key_string = @"MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJO2i9BK6HJucAP/71qXHMEz2JcTjfvC+2qePfGhCKiCYdMHOedfPJ/QHSF/iM2G7tDU5hLTV12ekro2gjW6o0sCAwEAAQ==";


static NSString* client_private_key_string = @"MIIBVQIBADANBgkqhkiG9w0BAQEFAASCAT8wggE7AgEAAkEAo2VMTMp1v/bddhDSRiZsnTnMjN8paDlHKUI6yf+ZZWEg2zzsGQRG+vDSsYC9+FtE06XNEno3SGelhmYhQ6savwIDAQABAkEAhqqwbgHXdnWCJRLMG2ED17mRavFqcSn0Cn85cM6moLRPu/HBKNHrD9Iu+tXgkqXbDu3lrCwCieRUrN1CwRNrQQIhAOJ6CJvTOmBKJ4nEPw1ZGn31fCF6yzVVnb2w9DyUxgsPAiEAuLIhE00Br41lKeM7s7WyhFv5LDj4gS0jL5Moi+HQtVECIQCcjAgpVi/y4S9FXn7LBj12tdqQ9eVDP6QivA+HVLs0ZwIgKRkCASB2ipDE/QAiTcfVlFw+4tc+fMgFd1WghRfXcDECIAtbg9pD4x5JeNvftHntBXlEkyBMGGAl8p0SxCGFW5j6";

typedef enum {
    KeyTypePublic = 0,
    KeyTypePrivate
}KeyType;

@interface MBRSAHandler : NSObject

- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

//验证签名 Sha1 + RSAx
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;
//验证签名 md5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;

- (NSString *)signString:(NSString *)string;

- (NSString *)signMD5String:(NSString *)string;


- (NSString *) encryptWithPublicKey:(NSString*)content;
- (NSString *) decryptWithPrivatecKey:(NSString*)content;

@end
