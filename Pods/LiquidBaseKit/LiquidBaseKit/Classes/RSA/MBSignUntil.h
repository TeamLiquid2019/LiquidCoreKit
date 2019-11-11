//
//  MBSignUntil.h
//  MotoBand
//
//  Created by 谭诚 on 2018/5/16.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBSignUntil : NSObject

//加签
+ (NSDictionary *)mbSigntWithParamDic:(NSDictionary *)param;

//验签
+ (NSDictionary *)mbVerifySignWithParamDic:(NSDictionary *)param;

@end
