//
//  MBSignUntil.m
//  MotoBand
//
//  Created by 谭诚 on 2018/5/16.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "MBSignUntil.h"

#import "MBRSAHandler.h"
#import <YYKit/NSString+YYAdd.h>

@implementation MBSignUntil

//加签
+ (NSDictionary *)mbSigntWithParamDic:(NSDictionary *)param{
    if (param == nil) {
        NSLog(@"传入的数据为空");
        return nil;
    }
    
    NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]initWithDictionary:param];
    
    //原始json对字符串加签
    NSArray *mutDickeys = [mutDic allKeys];
    //排序
    NSArray *sortedallKeys = [mutDickeys sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
        return (NSComparisonResult)[obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    //拼接
    __block NSMutableString *needSignString = [[NSMutableString alloc]init];
    [sortedallKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0 && ![needSignString isEqualToString:@""]) {
            [needSignString appendString:@"&"];
        }
        NSString *string = [mutDic objectForKey:key];
        [needSignString appendFormat:@"%@=%@",key,string];
    }];
    
    if (needSignString == nil || [needSignString isEqualToString:@""]) {
        NSLog(@"获取待加签字符串失败");
        return  nil;
    }
    
    NSString *needSignMD5 = [needSignString md5String];

    //字符串加签
    MBRSAHandler* handler = [MBRSAHandler new];
    [handler importKeyWithType:KeyTypePrivate andkeyString:client_private_key_string];
    [handler importKeyWithType:KeyTypePublic andkeyString:service_public_key_string];
    
    NSString *signString = [handler signString:needSignMD5];
    if (signString == nil || [signString isEqualToString:@""]) {
        NSLog(@"param 加签失败");
        return nil;
    }
    [mutDic setObject:signString forKey:@"sign"];
    
    return [mutDic copy];
}

//验签
+ (NSDictionary *)mbVerifySignWithParamDic:(NSDictionary *)param{
    if (param == nil) {
        NSLog(@"传入的数据为空");
        return nil;
    }
    
    //响应字典
    NSMutableDictionary *responseObjectDic = [[NSMutableDictionary alloc]initWithDictionary:param];
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithArray:[responseObjectDic allKeys]];
    //去掉不需要的
    if ([keys containsObject:@"sign"]) {
        [keys removeObject:@"sign"];
    }
    //排序
    NSArray *sortedallKeys = [keys sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
        return (NSComparisonResult)[obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
     __block NSMutableString *needverifyOrgString = [[NSMutableString alloc]init];
    
    [sortedallKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0 && ![needverifyOrgString isEqualToString:@""]) {
            [needverifyOrgString appendString:@"&"];
        }
        //responseObject
        NSString *responseObjectValue = [responseObjectDic objectForKey:key];
        if (responseObjectValue) {
            [needverifyOrgString appendFormat:@"%@=%@",key,responseObjectValue];
        }
    }];
    
    
    if (needverifyOrgString == nil || [needverifyOrgString isEqualToString:@""]) {
        NSLog(@"获取待加签字符串失败");
        return  nil;
    }
    
    NSString *signString = [responseObjectDic objectForKey:@"sign"];
    if (signString == nil ||  [signString isEqualToString:@""]) {
        NSLog(@"解签sign 为空");
        return nil;
    }
    
    NSString *needverifyOrgMD5= [needverifyOrgString md5String];
    
    MBRSAHandler* handler = [MBRSAHandler new];
    [handler importKeyWithType:KeyTypePrivate andkeyString:client_private_key_string];
    [handler importKeyWithType:KeyTypePublic andkeyString:service_public_key_string];
    //延签
    BOOL isMatch = [handler verifyString:needverifyOrgMD5 withSign:signString];
    if (isMatch == NO) {
        NSLog(@"验签失败");
        return nil;
    }

    return responseObjectDic;
    
    
}

@end
