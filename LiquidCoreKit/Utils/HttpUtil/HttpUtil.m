//
//  HttpUtil.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "HttpUtil.h"

#import "LiquidCoreMacro.h"
#import "AppDotNetAPIClient.h"
#import "TLResponse.h"
#import "TLResponseCode.h"
#import "DateUtil.h"
#import "LogonManager.h"

#import <TLNetworking.h>
#import <TLUtil.h>
#import <MBSignUntil.h>
#import <NSObject+YYModel.h>

@implementation HttpUtil

#pragma mark - < 单例模式 >

+ (instancetype)shareInstance{
    static HttpUtil *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[super allocWithZone:nil] init];
        }
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone{
    return [HttpUtil shareInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [HttpUtil shareInstance];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [HttpUtil shareInstance];
}

#pragma mark - < 外部方法 >

/// post请求方法
/// @param url url
/// @param params 参数
/// @param timeout 超时
/// @param validUser 验证用户
/// @param completeBlock 结果回调
- (void)postHttpWithUrl:(NSString *)url params:(NSMutableDictionary *)params timeout:(NSTimeInterval)timeout validUser:(BOOL)validUser andCompleteBlock:(void(^)(NSString *code ,TLResponse *response))completeBlock{
    
    //网关处理
    AppDotNetAPIClient *manager = [AppDotNetAPIClient shareClient];
    manager.requestSerializer.timeoutInterval = timeout;
    //设置底层使用的网关（如没有特殊需求，可以不进行设置，使用默认manager请求数据）
    [[TLNetworking sharedInstance] configSessinManager:manager];
    
    //参数处理(针对不同app，可以根据业务需求在这里增加公共参数设置)
    if (params == nil) {
        params = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    
    //用户验证处理
    NSString *userID = [LogonManager currentUserId];
    NSString *userToken = [LogonManager currentUserToken];
    if (validUser == YES) {
        if (userID == nil || userToken == nil) {
            if (completeBlock) {
                completeBlock(TLCode_ERROR,nil);
            }
            return;
        }
        [params setObject:userID forKey:@"userid"];
        [params setObject:userToken forKey:@"token"];
    }
    
    //公共参数设置
    NSString *reqClient = @"100";
    long long longlongReqTime = [[NSDate date]timeIntervalSince1970];
    NSString *reqTime = [DateUtil dateyyyyMMddhhmmssfff:longlongReqTime];
    NSString *reqUUIDStr = [TLUtil getUUIDString];
    NSString *reqUUID = [reqUUIDStr substringFromIndex:reqUUIDStr.length-16];
    NSString *reqNumber = [NSString stringWithFormat:@"%@%@%@",reqClient,reqTime,reqUUID];
    [params setObject:reqNumber forKey:@"requestid"];
    [params setObject:@"1" forKey:@"ctype"];
    
    NSString *version = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
    NSString *build = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"];
    NSString *cversion = [NSString stringWithFormat:@"%@.%@",version,build];
    [params setObject:cversion forKey:@"cversion"];
    
    NSString *deviceToken = [LogonManager getDeviceToken];
    if (deviceToken) {
        [params setObject:deviceToken forKey:@"devicetoken"];
    }
    
    //参数加签(根据自身app来定制，目前加密，加签放入了BaseKit组件中)
    params = [[NSMutableDictionary alloc]initWithDictionary:[MBSignUntil mbSigntWithParamDic:params]];
    
    __block TLURLSessionTask *task = nil;
    
    task = [[TLNetworking sharedInstance] postWithUrl:url params:params cache:NO progressBlock:^(int64_t bytesRead, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"========网络请求成功========\r\n%@",[self toReponseString:task.response andRequest:task.currentRequest andResponseObj:response]);
        
        //数据解析（根据app定制修改）
        NSDictionary *dic = [MBSignUntil mbVerifySignWithParamDic:response];
        TLResponse *tlResponse = [TLResponse modelWithDictionary:dic];
        if (completeBlock) {
            if (tlResponse) {
                completeBlock(TLCode_SUCCESS,tlResponse);
            }else{
                completeBlock(TLCode_ERROR,nil);
                NSLog(@"=========网络请求失败========\r\n%@",[self toReponseString:task.response andRequest:task.currentRequest andResponseObj:nil]);
            }
        }
    } failBlock:^(NSError *error) {
        if (completeBlock) {
            completeBlock(TLCode_ERROR,nil);
        }
        NSLog(@"=========网络请求失败========\r\n%@",[self toReponseString:task.response andRequest:task.currentRequest andResponseObj:nil]);
    }];
}

- (NSString *)toReponseString:(NSURLResponse *)response andRequest:(NSURLRequest *)request andResponseObj:(id)resposeObj{
    if (request) {
        NSMutableString* ret = [[NSMutableString alloc] initWithCapacity:1024];
        [ret appendFormat:@"\r\n|--------------------Get Response Start-----------|\r\n"];
        [ret appendString:@"|----- EEResponse -----|\r\n"];
        [ret appendFormat:@"| url = %@\r\n",request.URL];
        [ret appendFormat:@"| requestMethod = %@\r\n",request.HTTPMethod];
        //        [ret appendFormat:@"| requestHeaders = %@\r\n",request.allHTTPHeaderFields];
        [ret appendFormat:@"| requestBody = %@\r\n",[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]];
        [ret appendString:@"\r\n"];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        //        [ret appendFormat:@"| responseHeaders = %@\r\n",httpResponse.allHeaderFields];
        [ret appendFormat:@"| responseStatusCode = %ld\r\n",(long)httpResponse.statusCode];
        [ret appendFormat:@"| responseResponseBody = %@\r\n",resposeObj];
        [ret appendFormat:@"|-------------------Get Response Finished---------------|\r\n"];
        return ret;
    }
    return nil;
}

@end
