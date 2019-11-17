//
//  UIMacro.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/12.
//  Copyright © 2019 Eric. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h


//RGB颜色
#define RGBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

//屏幕尺寸
#define ScreenHeight    [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth     [[UIScreen mainScreen] bounds].size.width




//引导页文案
#define YDPicNameArray @[@"iOS_Intro_A.png",@"iOS_Intro_B.png",@"iOS_Intro_C.png",@"iOS_Intro_D.png",@"iOS_Intro_E.png",@"iOS_Intro_F.png"]

#define YDTitleArray @[@"架构升级",@"群组",@"群组",@"门店",@"租赁",@"让骑行更快乐"]

#define YDDesTitleArray @[@"全新签到和积分中心",@"组建自己的区域群、车型群、俱乐部",@"功能我就放这了，怎么用你说的算",@"官方门店，全方位服务骑士",@"最少花费，想骑什么就骑什么",@"JUST RIDE!"]

#endif /* UIMacro_h */
