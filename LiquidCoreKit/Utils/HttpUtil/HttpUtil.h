//
//  HttpUtil.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLResponse;

@interface HttpUtil : NSObject<NSCopying,NSMutableCopying>

+ (instancetype)shareInstance;

/// post请求方法
/// @param url url
/// @param params 参数
/// @param timeout 超时
/// @param validUser 验证用户
/// @param completeBlock 结果回调
- (void)postHttpWithUrl:(NSString *)url params:(NSMutableDictionary *)params timeout:(NSTimeInterval)timeout validUser:(BOOL)validUser andCompleteBlock:(void(^)(NSString *code ,TLResponse *response))completeBlock;





@end


