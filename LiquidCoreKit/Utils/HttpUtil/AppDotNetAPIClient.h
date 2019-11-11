//
//  AppDotNetAPIClient.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)shareClient;

@end

NS_ASSUME_NONNULL_END
