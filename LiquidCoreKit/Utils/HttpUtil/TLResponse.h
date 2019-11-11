//
//  TLResponse.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLResponse : NSObject

@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,assign) long long updatetime;
@property (nonatomic,assign) id data;
@property (nonatomic,strong) NSDictionary *map;

@end

NS_ASSUME_NONNULL_END
