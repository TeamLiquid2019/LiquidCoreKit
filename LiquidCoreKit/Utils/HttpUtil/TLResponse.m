//
//  TLResponse.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "TLResponse.h"

#import <YYKit.h>

@implementation TLResponse

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    self.data = [dic objectForKey:@"data"];
    self.map = [dic objectForKey:@"map"];
    self.msg = [dic objectForKey:@"msg"];
    return YES;
}

@end
