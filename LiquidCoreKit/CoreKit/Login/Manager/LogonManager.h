//
//  LogonManager.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SynthesizeSingleton.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogonManager : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(LogonManager);

+ (nullable NSString *)currentUserId;
+ (nullable NSString *)currentUserToken;
+ (nullable NSString *)getDeviceToken;
+ (nullable NSString *)getrefreshToken;


@end

NS_ASSUME_NONNULL_END
