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

#endif /* UIMacro_h */
