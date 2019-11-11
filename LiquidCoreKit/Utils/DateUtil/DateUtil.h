//
//  NSDateUtils.h
//  CinCommon
//
//  Created by ProbeStar on 13-11-16.
//  Copyright (c) 2013年 p. All rights reserved.
//

//注意：所有的long long类型的date参数的单位均是秒
#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+ (NSDate *)dateFromyyyyMMddHHmmssString:(NSString *)str;

+ (NSString *)dateyyyyMMddhhmmssfff:(long long)date;

+ (NSDate *)dateFromyyyyMMddString:(NSString *)str;

+ (NSString *)getyyyyMMddDate:(long long )date;

+ (NSString *)getyyyy_MM_ddDate:(long long )date;

+ (NSString *)getyyyy_MMDate:(long long )date;

+ (NSString *)getyyyyMMddLongLongValueFromDate:(NSDate *)date;

+ (NSString *)getyyyy_MM_ddHHmmStr:(long long)date;

+ (NSString *)getMMddDate:(long long )date ;

+ (NSString *)getCHMMddDate:(long long )date;

+ (NSString *)get24Time:(long long)date;

+ (NSString *)get12Time:(long long)date;

//根据系统24or12小时设置的格式返回时间串
+ (NSString *)get24Or12TimeBySystemSetting:(long long)date;

+ (NSString *)get24Or12TimeHHmmStr:(long long)date;

//判断系统时间是否为12小时制。Return：YES12小时制；NO24小时制
+ (BOOL)is12HourClockIniOS;

+ (NSString *)getTimeStrByDate:(NSDate *)date;

//返回date与当前日期相差的天数 返回0当天天，1昨天，2前天，以此类推
+ (NSInteger)getDaysFromAnotherDay:(long long)date;

//返回date与date相差的天数 
+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

#pragma mark - Get Single Value
//返回197001001至date的天数。date：1970到现在的秒数
//+ (long long)getDaysFrom1970:(long long)date;

+ (NSInteger)getYear:(long long)date;

+ (NSInteger)getMonth:(long long)date;

+ (NSInteger)getDay:(long long)date;

//获得星期几，1星期天；2星期一。。。。。7星期六
+ (NSInteger)getWeekDay:(long long)date;

+ (NSInteger)getHour:(long long)date;

+ (NSInteger)getMinute:(long long)date;

+ (NSInteger)getSecond:(long long)date;

#pragma mark -
#pragma mark - 朋友圈显示时间转换

+ (NSString *)getSocialTime:(long long)date;

#pragma mark -
#pragma mark - DialogListTime

+ (NSString *)getDialogListTime:(long long)lastMessageTime;
+ (NSString *)getDialogDay:(long long)lastMessageTime;
#pragma mark -
#pragma mark - video时间转换
//00:00:00
+ (NSString *)videoTimeOfTimeInterval:(NSTimeInterval)timeInterval;

#pragma mark - 获取日期和时间

+ (NSString *)getyyyyMMddHHmmStr:(long long)date;

+ (NSString *)getyyyyMMddHHmmssStr:(long long)date;

+ (NSString *)getMMddHHmmStr:(long long)date;

+ (NSString *)getHHmmStr:(long long)date;

#pragma mark - NSDate 和 NSString 转换

+ (NSDate *)convertDateFromString:(NSString*)dateStr;

//输入的日期字符串形如：@"1992-05-21 13:08:08"
+ (NSDate *)dateFromString:(NSString *)dateString;

+ (NSDate *)dateyyyyMMddFromString:(NSString *)dateString;

//输入的日期字符串形如：@"1992-05-21 13:08:08"
+ (NSDate *)dateyyyyMMddHHmmssFromString:(NSString *)dateString;

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)getCHWeekDay:(long long)date;


#pragma mark - 带业务的

+ (NSDate *)earlierNowDate:(NSDate *)nowDate withYear:(int)earlierYear;

+ (NSString *)rideCellDateFromDate:(NSDate *)date;

+ (NSString *)rideTimeFromDate:(NSDate *)date;

+ (NSString *)rideTitleFromDate:(long long)date;

+ (NSString *)reportTitleFromDate:(long long)date;


+(NSString *)currentDateWithFormat:(NSString *)format;
+(NSString *)timeIntervalFromLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)format1 ToCurrentTime:(NSString *)currentTime currentTimeFormat:(NSString *)format2;
+(NSString *)timeIntervalFromLastTime:(NSDate *)lastTime TocurrentTime:(NSDate *)currentTime;
+ (NSString *)timeIntervalMinUnitSecondsFromLastTime:(NSDate *)lastTime toCurrentTime:(NSDate *)currentTime;
+ (NSString *)insuranceGetyyyyMMddHHmmssStr:(long long)date;


+ (NSString *)getAddRecommendTime:(long long)date;

+ (NSString *)getRideToolAdTime:(long long)date;



#pragma mark - 获取当前日期前几天的日期和后几天的日期数组


/**
 获取当前日期前几天的日期和后几天的日期数组(包含今天)

 @param bDay 前多少天
 @param aDay 后多少天
 @return 2017-03-11
 */
+ (NSMutableArray *)getDateArrayWithBefore:(int)bDay andAfter:(int)aDay;







@end
