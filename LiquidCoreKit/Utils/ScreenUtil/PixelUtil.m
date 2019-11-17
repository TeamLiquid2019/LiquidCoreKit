//
//  PixelUtil.m
//  MotoBand
//
//  Created by Eric on 16/7/15.
//  Copyright © 2016年 MotoBand-Eric. All rights reserved.
//

#import "PixelUtil.h"

//Tools

@implementation PixelUtil

+ (CGFloat)convert375_667WidthPixel:(CGFloat)pixel{
    return ceilf(pixel*[[UIScreen mainScreen] bounds].size.width/375);
}

+ (CGFloat)convert375_667HeightPixel:(CGFloat)pixel{
    return ceilf(pixel*[[UIScreen mainScreen] bounds].size.height/667);
}


+ (CGFloat)convert320_568WidthPixel:(CGFloat)pixel{
    return ceilf(pixel*[[UIScreen mainScreen] bounds].size.width/320);
}

+ (CGFloat)convert320_568HeightPixel:(CGFloat)pixel{
    return ceilf(pixel*[[UIScreen mainScreen] bounds].size.height/568);
}

+ (CGSize)getNewSizeWithBiaoZhuSize:(CGSize)biaozhuSize{
    CGFloat widthScale = biaozhuSize.width*1.0f/375;
    CGFloat newW = [[UIScreen mainScreen] bounds].size.width*widthScale;
    CGFloat newH = biaozhuSize.height*newW*1.0f/biaozhuSize.width;
    return CGSizeMake(newW, newH);
}

//返回字符串所占用的尺寸.
+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize andString:(NSString *)str
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize s=[str boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
              NSStringDrawingUsesLineFragmentOrigin |
              NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    return s;
}

@end
