//
//  NSDateUtils.m
//  CinCommon
//
//  Created by ProbeStar on 13-11-16.
//  Copyright (c) 2013年 p. All rights reserved.
//

#import "DateUtil.h"
#import <NSDate+YYAdd.h>

@implementation DateUtil

+ (NSDate *)dateFromyyyyMMddHHmmssString:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    NSDate *date = [dateFormatter dateFromString:str];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    
    return localDate;
}


+ (NSDate *)dateFromyyyyMMddString:(NSString *)str {
    NSDate *date = [[self shareyyyyMMddNSDateFormatter] dateFromString:str];
    return date;
}

+ (NSString *)getyyyyMMddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyy_MMDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyy_MM_ddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyyMMddLongLongValueFromDate:(NSDate *)date {
    NSString *yyyyMMddStr = [[self shareyyyyMMddNSDateFormatter] stringFromDate:date];
    return yyyyMMddStr;
}

+ (NSString *)getMMddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)dateyyyyMMddhhmmssfff:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    NSString *timeStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    int x = (int)(100 + (arc4random() % (1000 - 100 + 1)));
    return [NSString stringWithFormat:@"%@%@",timeStr,[NSString stringWithFormat:@"%d",x]];
}

+ (NSString *)getCHMMddDate:(long long )date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"M月d日"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyyMMddHHmmStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyy_MM_ddHHmmStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getyyyyMMddHHmmssStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getMMddHHmmStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getHHmmStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getddMMMMDate:(long long )date {//显示英文月份全称 如09-Septemper
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"dd/MMMM"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getddMMMDate:(long long )date {//显示英文月份简称 如09-Sep
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"dd/MMM"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get24Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}


+ (NSString *)gethhmm12Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:[languages objectAtIndex:0]]];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get12Time:(long long)date {
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:[languages objectAtIndex:0]]];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)get24Or12TimeBySystemSetting:(long long)date
{
    //    if( [self is12HourClockIniOS]){
    //        return  [self get12Time:date];
    //    }else{
    return  [self get24Time:date];
    //    }
}

+ (NSString *)get24Or12TimeHHmmStr:(long long)date
{
    if( [self is12HourClockIniOS]){
        return  [self gethhmm12Time:date];
    }else{
        return  [self get24Time:date];
    }
}

+ (BOOL)is12HourClockIniOS{
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale autoupdatingCurrentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    return containsA.location != NSNotFound;
}

+ (NSString *)getTimeStrByDate:(NSDate *)date {
    if (date == nil)
        return @"";
    
    NSMutableString *displayStr = [NSMutableString string];
    NSDate *now = [NSDate date];
    NSTimeInterval time = [now timeIntervalSinceDate:date];
    
    
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
//    [dateFormatter setDateFormat:@"yyyy"];
//    NSString *yearStr = [dateFormatter stringFromDate:date];
    
    [dateFormatter setDateFormat:@"HH"];
    int nowHour = [[dateFormatter stringFromDate:now] intValue];
    int days_ago = ((int)time + 3600*(24-nowHour))/(3600*24);
    
    if (days_ago == 0) {
        [displayStr appendString:[NSString stringWithFormat:@"今天 %@", timeStr]];
    } else if(days_ago == 1) {
        [displayStr appendString:[NSString stringWithFormat:@"昨天 %@", timeStr]];
    } else if(days_ago == 2) {
        [displayStr appendString:[NSString stringWithFormat:@"前天 %@", timeStr]];
    } else if(days_ago > 2 && days_ago < 365){
        [displayStr appendString:[NSString stringWithFormat:@"%d天前",days_ago]];
    } else if(days_ago > 10000 ){
        [displayStr appendString:[NSString stringWithFormat:@"%@",@""]];
    } else{
        if(dateStr&&dateStr.length > 0)
            [displayStr appendString:@"一年前"];
//            [displayStr appendString:dateStr];
    }
    return displayStr;
}

//返回0 当天，1昨天，2前天，以此类推
//之前那样用时间差来整除一天的秒数，计算出来的天数有误差
+ (NSInteger)getDaysFromAnotherDay:(long long)date {
    //    return [self getDaysFrom1970:date] - [self getDaysFrom1970:[[NSDate date] timeIntervalSince1970]];
    //    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //    [comps setDay:[NSDateUtils getDay:date]];
    //    [comps setMonth:[NSDateUtils getMonth:date]];
    //    [comps setYear:[NSDateUtils getYear:date]];
    //    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //    NSDate *endDate = [[NSDate alloc] init];
    //    NSDate *startDate = [gregorian dateFromComponents:comps];
    //    [comps release];
    //    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    //    NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:startDate toDate:endDate options:0];
    //    [gregorian release];
    //    [endDate release];
    ////    int days = [comps2 day];
    //    NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
    //    NSInteger days = ((NSInteger)interval)/(3600*24);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    NSDate *today = [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
    NSDate *startDate = [dateFormatter dateFromString:[DateUtil getyyyyMMddDate:date]];
    NSDate *formatterStartDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:startDate]];
    NSTimeInterval interval = [today timeIntervalSinceDate:formatterStartDate];
    NSInteger days = ((NSInteger)interval)/(3600*24);
    return days;
}

#pragma mark - Get Single Value
//+ (long long)getDaysFrom1970:(long long)date {
//    return date / 86400;
//}

+ (NSInteger)getYear:(long long)date {
    return [[self getNSDateComponents:date] year];
}

+ (NSInteger)getMonth:(long long)date {
    return [[self getNSDateComponents:date] month];
}

+ (NSInteger)getDay:(long long)date {
    return [[self getNSDateComponents:date] day];
}

+ (NSInteger)getWeekDay:(long long)date {
    return [[self getNSDateComponents:date] weekday];
}

+ (NSInteger)getHour:(long long)date {
    return [[self getNSDateComponents:date] hour];
}

+ (NSInteger)getMinute:(long long)date {
    return [[self getNSDateComponents:date] minute];
}

+ (NSInteger)getSecond:(long long)date {
    return [[self getNSDateComponents:date] second];
}

+ (NSDateComponents *)getNSDateComponents:(long long)date {
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [[self shareNSCalendar] components:unitFlags fromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    return comps;
}

+ (NSString *)getCHWeekDay:(long long)date{
    switch ([[self getNSDateComponents:date] weekday]) {
        case 1:
        {
            return @"周日";
        }
            break;
        case 2:
        {
            return @"周一";
        }
            break;
        case 3:
        {
            return @"周二";
        }
            break;
        case 4:
        {
            return @"周三";
        }
            break;
        case 5:
        {
            return @"周四";
        }
            break;
        case 6:
        {
            return @"周五";
        }
            break;
        case 7:
        {
            return @"周六";
        }
            break;
        default:
            return @"";
            break;
    }
}

/**
 * @method
 *
 * @brief 获取两个日期之间的天数
 * @param fromDate       起始日期
 * @param toDate         终止日期
 * @return    总天数
 */
+ (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents    * comp = [calendar components:NSCalendarUnitDay
                                             fromDate:fromDate
                                               toDate:toDate
                                              options:NSCalendarWrapComponents];
    NSLog(@" -- >>  comp : %@  << --",comp);
    return comp.day;
}

#pragma mark - Share Instance 减少创建NSDateFormatter、NSCalendar等的开销

+ (NSCalendar *)shareNSCalendar
{
    static NSCalendar *calendar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    });
    return calendar;
}

+ (NSDateFormatter *)shareyyyyMMddNSDateFormatter
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter= [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
    });
    return dateFormatter;
}

#pragma mark -
#pragma mark - 朋友圈显示时间转换

+ (NSString *)getSocialTime:(long long)date{
    NSString *timeStr = nil;
    //    //获取当前时间
    //	NSDate *daten = [NSDate date];
    //    //当前秒数
    //    double localTime = [daten timeIntervalSince1970];
    //    //服务器秒数
    //    double serverTime = (double)( date / 1000 );
    //    double c = fabs(localTime-serverTime);
    //
    //    if (c<60) {//小于1分钟
    //        timeStr = [NSString stringWithFormat:@"%@",NSInternational(@"General_Now")];
    //    }else if (c >=60 && c<60*60){//小于一小时
    //        int n = c/(60);
    //        timeStr = NSInternationalFormat(@"General_Minute", [NSString stringWithFormat:@"%d",n]);
    //    }else if (c >= 60*60 && c< 60*60*24){//小于一天
    //        int n = c/(60*60);
    //        if (n == 1) {
    //            timeStr = NSInternationalFormat(@"General_Hour", [NSString stringWithFormat:@"%d",n]);
    //        }else{
    //            timeStr = NSInternationalFormat(@"General_Hour", [NSString stringWithFormat:@"%d",n]);
    //        }
    //    }else if (c >= 60*60*24 && c < 60*60*24*2){//小于两天
    //        timeStr = NSInternationalFormat(@"Social_Yesterday", [self get12Time:serverTime]);
    //    }else{//大于两天
    //        //当前年份
    //        NSInteger localYear = [self getYear:localTime];
    //        //服务器年份
    //        NSInteger serverYear = [self getYear:serverTime];
    //        if (localYear != serverYear) {
    //            timeStr = [NSString stringWithFormat:@"%ld/%ld/%ld %@",(long)[self getDay:serverTime],(long)[self getMonth:serverTime],(long)[self getYear:serverTime],[self get12Time:serverTime]];
    //        }else{
    //            timeStr = [NSString stringWithFormat:@"%ld/%ld %@",(long)[self getDay:serverTime],(long)[self getMonth:serverTime],[self get12Time:serverTime]];
    //        }
    //    }
    return timeStr;
}

#pragma mark -
#pragma mark - DialogList Time
//当天消息显示几点几分，如13:20,昨天消息显示昨天，如yesterday；
//前两天消息显示日-月，如18-September(中文模式就是09-18),跨年的消息显示日-月-年，
//英文 31-Dec-2013(中文模式是2013-12-31)
+ (NSString *)getDialogListTime:(long long)lastMessageTime {
    NSString *timeDisplayStr;
    long long temp = [DateUtil getDaysFromAnotherDay:lastMessageTime];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    
    NSString *currentLanguage =[languages objectAtIndex:0];
    if(temp == 0){
        timeDisplayStr = [DateUtil get24Or12TimeBySystemSetting:lastMessageTime];
    }else if(temp == 1){
        timeDisplayStr = @"Yesterday";
    }else{
        if([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [DateUtil getMMddDate:lastMessageTime];
        } else {
            timeDisplayStr = [DateUtil getddMMMDate:lastMessageTime];
        }
    }
    NSInteger tempYear = [DateUtil getYear:lastMessageTime];
    NSDate *nowDate = [NSDate date];
    NSInteger currentYear = [DateUtil getYear:[nowDate timeIntervalSince1970]];
    if (tempYear < currentYear) {
        NSString *year = [NSString stringWithFormat:@"%ld",(long)tempYear];
        if ([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",year,timeDisplayStr];
        } else {
            NSString *timeStr = [DateUtil getddMMMDate:lastMessageTime];
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",timeStr,year];
        }
    }
    return timeDisplayStr;
}

+ (NSString *)getDialogDay:(long long)lastMessageTime {
    NSString *timeDisplayStr;
    NSInteger temp = [DateUtil getDaysFromAnotherDay:lastMessageTime];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    
    NSString *currentLanguage =[languages objectAtIndex:0];
    if(temp == 0){
        timeDisplayStr = @"Today";
    }else if(temp == 1){
        timeDisplayStr =@"Yesterday";
    }else{
        if([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [DateUtil getMMddDate:lastMessageTime];
        } else {
            timeDisplayStr = [DateUtil getddMMMDate:lastMessageTime];
        }
    }
    NSInteger tempYear = [DateUtil getYear:lastMessageTime];
    NSDate *nowDate = [NSDate date];
    NSInteger currentYear = [DateUtil getYear:[nowDate timeIntervalSince1970]];
    if (tempYear < currentYear) {
        NSString *year = [NSString stringWithFormat:@"%ld",(long)tempYear];
        if ([currentLanguage isEqualToString:@"zh-Hans"]) {
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",year,timeDisplayStr];
        } else {
            NSString *timeStr = [DateUtil getddMMMDate:lastMessageTime];
            timeDisplayStr = [NSString stringWithFormat:@"%@-%@",timeStr,year];
        }
    }
    return timeDisplayStr;
}

+ (NSString *)videoTimeOfTimeInterval:(NSTimeInterval)timeInterval {
    NSDateComponents *components = [self componetsWithTimeInterval:timeInterval];
    if (components.hour > 0) {
        return [NSString stringWithFormat:@"%ld:%02ld:%02ld", (long)components.hour, (long)components.minute, (long)components.second];
    } else {
        return [NSString stringWithFormat:@"%ld:%02ld", (long)components.minute, (long)components.second];
    }
}

+ (NSDateComponents *)componetsWithTimeInterval:(NSTimeInterval)timeInterval {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:timeInterval sinceDate:date1];
    
    unsigned int unitFlags =
    NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour |
    NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    return [calendar components:unitFlags
                       fromDate:date1
                         toDate:date2
                        options:0];
}



#pragma mark - NSDate 和 NSString 转换

+ (NSDate *)convertDateFromString:(NSString*)dateStr;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *date=[formatter dateFromString:dateStr];
    return date;
}

//输入的日期字符串形如：@"1992-05-21 13:08:08"
+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"HH:mm"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

//输入的日期字符串形如：@"1992-05-21"
+ (NSDate *)dateyyyyMMddFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

//输入的日期字符串形如：@"1992-05-21 13:08:08"
+ (NSDate *)dateyyyyMMddHHmmssFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}


+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}


+ (NSString *)rideCellDateFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (NSString *)rideTimeFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (NSString *)rideTitleFromDate:(long long)date{
    NSMutableString *title = [[NSMutableString alloc] init];
    //获取中文日期，11月3日
    [title appendString:[self getCHMMddDate:date]];
    //获取星期几
    [title appendString:[self getCHWeekDay:date]];
    //获取早上凌晨。。。
    NSInteger hour = [self getHour:date];
    [title appendString:[self getDesWithHour:hour]];
    [title appendString:@"的骑行"];
    return title;
}


+ (NSString *)reportTitleFromDate:(long long)date{
    NSMutableString *title = [[NSMutableString alloc] init];
    //获取中文日期，11月3日
//    [title appendString:[self getCHMMddDate:date]];
    //获取星期几
    [title appendString:[self getCHWeekDay:date]];
    //获取早上凌晨。。。
    NSInteger hour = [self getHour:date];
    [title appendString:[self getDesWithHour:hour]];
    [title appendString:@"的骑行"];
    return title;
}

+ (NSString *)getDesWithHour:(NSInteger)hour{
    if (hour>=3 && hour<6) {
        return @"凌晨";
    }else if (hour>=6 && hour<8){
        return @"早上";
    }else if (hour>=8 && hour<11){
        return @"上午";
    }else if (hour>=11 && hour<13){
        return @"中午";
    }else if (hour>=13 && hour<17){
        return @"下午";
    }else if (hour>=17 && hour<19){
        return @"傍晚";
    }else if (hour>=19 && hour<23){
        return @"晚上";
    }else if (hour>=23 || hour<3){
        return @"深夜";
    }else{
        return @"";
    }
}

+(NSString *)currentDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+(NSString *)timeIntervalFromLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)format1 ToCurrentTime:(NSString *)currentTime currentTimeFormat:(NSString *)format2{
    //上次时间
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc]init];
    dateFormatter1.dateFormat = format1;
    NSDate *lastDate = [dateFormatter1 dateFromString:lastTime];
    //当前时间
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc]init];
    dateFormatter2.dateFormat = format2;
    NSDate *currentDate = [dateFormatter2 dateFromString:currentTime];
    
    return [self timeIntervalFromLastTime:lastDate TocurrentTime:currentDate];

}
+(NSString *)timeIntervalFromLastTime:(NSDate *)lastTime TocurrentTime:(NSDate *)currentTime
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    //上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    //当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *lastyearStr = [dateFormatter stringFromDate:lastDate];
    NSString *nowyearStr = [dateFormatter stringFromDate:currentDate];
    
    if (![lastyearStr isEqualToString:nowyearStr]) {
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy/M/d";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }
    
    //时间间隔
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    
    //秒、分、小时、天、月、年
    NSInteger minutes = intevalTime/60;
    NSInteger hours = intevalTime/60/60;
    NSInteger day = intevalTime/60/60/24;
    NSInteger month = intevalTime/60/60/24/30;
    NSInteger years = intevalTime/60/60/24/365;
    
    if (minutes <= 10) {
        return @"刚刚";
    }else if (minutes < 60){
        return [NSString stringWithFormat:@"%ld分钟前",(long)minutes];
    }else if (hours < 24){
        return [NSString stringWithFormat:@"%ld小时前",(long)hours];
    }else if (day < 7){
        return [NSString stringWithFormat:@"%ld天前",(long)day];
    }else if (month < 12){
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"M月d日";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }else if (years >= 1){
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy/M/d";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }
    return @"";
}

+ (NSString *)timeIntervalMinUnitSecondsFromLastTime:(NSDate *)lastTime toCurrentTime:(NSDate *)currentTime{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    //上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    //当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *lastyearStr = [dateFormatter stringFromDate:lastDate];
    NSString *nowyearStr = [dateFormatter stringFromDate:currentDate];
    
    if (![lastyearStr isEqualToString:nowyearStr]) {
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy/M/d";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }
    
    //时间间隔
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    
    //秒、分、小时、天、月、年
    NSInteger minutes = intevalTime/60;
    NSInteger hours = intevalTime/60/60;
    NSInteger day = intevalTime/60/60/24;
    NSInteger month = intevalTime/60/60/24/30;
    NSInteger years = intevalTime/60/60/24/365;
    
    if (minutes < 1) {
        return @"刚刚";
    }else if (minutes < 60){
        return [NSString stringWithFormat:@"%ld分钟前",(long)minutes];
    }else if (hours < 24){
        return [NSString stringWithFormat:@"%ld小时前",(long)hours];
    }else if (day < 7){
        return [NSString stringWithFormat:@"%ld天前",(long)day];
    }else if (month < 12){
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"M月d日";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }else if (years >= 1){
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy/M/d";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }
    return @"";
}


+ (NSDate *)earlierNowDate:(NSDate *)nowDate withYear:(int)earlierYear{
    NSTimeInterval nowtime = [nowDate timeIntervalSince1970];
    NSInteger nowYear = [self getYear:nowtime];
    NSString *earlierTimeStr = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)(nowYear-earlierYear),(long)[self getMonth:nowtime],(long)[self getDay:nowtime]];
    return [self dateyyyyMMddFromString:earlierTimeStr];
}

+ (NSString *)insuranceGetyyyyMMddHHmmssStr:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getAddRecommendTime:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

+ (NSString *)getRideToolAdTime:(long long)date{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.M.dd"];
    [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    
    NSString *yyyymmdd = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *hhmm = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    
    NSString *zhou = [self getCHWeekDay:date];
    
    return [NSString stringWithFormat:@"%@ %@%@",yyyymmdd,zhou,hhmm];
}


#pragma mark - 获取当前日期前几天的日期和后几天的日期数组


/**
 获取当前日期前几天的日期和后几天的日期数组(包含今天)
 
 @param bDay 前多少天
 @param aDay 后多少天
 @return 2017-03-11
 */
+ (NSMutableArray *)getDateArrayWithBefore:(int)bDay andAfter:(int)aDay{
    NSMutableArray *dateArray = [[NSMutableArray alloc] init];
    //当前时间
    NSDate *nowDate = [NSDate date];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: nowDate];
//    NSDate *localDate = [nowDate  dateByAddingTimeInterval: interval];
    
    //获取往前多少天的时间
    for (int i = bDay; i>0; i--) {
        NSDate *getDate = [[NSDate alloc] initWithTimeInterval:-(60*60*24*i) sinceDate:nowDate];
        [dateArray addObject:getDate];
    }
    
    [dateArray addObject:nowDate];
    
    //获取往后多少天的时间
    for (int i = 1; i<=aDay; i++) {
        NSDate *getDate = [[NSDate alloc] initWithTimeInterval:60*60*24*i sinceDate:nowDate];
        [dateArray addObject:getDate];
    }
    
    return dateArray;
}

@end
