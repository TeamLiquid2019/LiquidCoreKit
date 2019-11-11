//
//  LogonManager.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "LogonManager.h"

@implementation LogonManager

SYNTHESIZE_SINGLETON_FOR_CLASS(LogonManager);

#pragma mark - < 静态方法 >

+ (nullable NSString *)currentUserId{
    return nil;
//    return [LogonManager sharedLogonManager].logonInfoModel.userid;
}

+ (nullable NSString *)currentUserToken{
    return nil;
//    return [LogonManager sharedLogonManager].logonInfoModel.usertoken;
}

+ (nullable NSString *)getDeviceToken{
    return nil;
//    return [LogonManager sharedLogonManager].logonInfoModel.deviceToken;
}

+ (nullable NSString *)getrefreshToken{
    return nil;
//    return [LogonManager sharedLogonManager].logonInfoModel.refreshtoken;
}



@end
