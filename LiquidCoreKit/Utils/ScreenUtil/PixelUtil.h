//
//  PixelUtil.h
//  MotoBand
//
//  Created by Eric on 16/7/15.
//  Copyright © 2016年 MotoBand-Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PixelUtil : NSObject

//按375-667为标注的转换
+ (CGFloat)convert375_667WidthPixel:(CGFloat)pixel;//转换宽度
+ (CGFloat)convert375_667HeightPixel:(CGFloat)pixel;//转换高度

//按320-568为标注的转换
+ (CGFloat)convert320_568WidthPixel:(CGFloat)pixel;//转换宽度
+ (CGFloat)convert320_568HeightPixel:(CGFloat)pixel;//转换高度

/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize andString:(NSString *)str;

+ (CGSize)getNewSizeWithBiaoZhuSize:(CGSize)biaozhuSize;

@end
