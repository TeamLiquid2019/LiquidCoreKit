//
//  LiquidCoreMacro.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#ifndef LiquidCoreMacro_h
#define LiquidCoreMacro_h

#pragma mark - < 环境变量 >

//测试环境
//#define HttpBaseURLString @"https://api.test.motuobang.com/test"
//#define GDMapAppKey @"ca0a348c01950508e442ef216d5e70be"
//#define kTXLiveAVKey @"c2ffd69cf4987b35fb7a781a2ef7a0d8"
//#define kTLSAppid     1400025315
//#define kSdkAppId       1400025315
//#define kSdkAccountType    2440
//#define YouZanUserAgent  @"4917e1b216333ebc29"
//#define YouZanSCHEME @"yzbasemotoband"
//#define YouZanMallID 41389727
//#define isProductEnv 0
//#define kMiniProgramid @"gh_8fd42da552d7"

//生产环境
#define HttpBaseURLString @"https://api.motuobang.com/release"
#define GDMapAppKey @"ca0a348c01950508e442ef216d5e70be"
#define kTXLiveAVKey @"c2ffd69cf4987b35fb7a781a2ef7a0d8"
#define kTLSAppid     1400025196
#define kSdkAppId       1400025196
#define kSdkAccountType    2440
#define YouZanUserAgent  @"5f7d5616a9f8abfddd"
#define YouZanSCHEME @"yzbasemotoband"
#define YouZanMallID 19045787
#define isProductEnv 1
#define kMiniProgramid @"gh_8fd42da552d7"



//常用宏定义
#define OBJISNULL(o) (o == nil || [o isKindOfClass:[NSNull class]] || ([o isKindOfClass:[NSString class]] && [o length] == 0))
#define DECLARE_WEAK_SELF __typeof(&*self) __weak weakSelf = self
#define DECLARE_STRONG_SELF __typeof(&*self) __strong strongSelf = weakSelf


#endif /* LiquidCoreMacro_h */
