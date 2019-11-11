//
//  AppDelegate.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/11.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "AppDelegate.h"

#import "SplashMovieViewController.h"

#import <CocoaLumberjack.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //系统设置
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    //初始化首页
    [self.window setRootViewController:[[SplashMovieViewController alloc] init]];
    
    //初始化第三方库
    [self initThirdParty];
    
    return YES;
}


#pragma mark - < 初始化第三方库 >

- (void)initThirdParty{
    
    //DDLog初始化
    if (@available(iOS 10.0, *)) {
        [DDLog addLogger:[DDOSLogger sharedInstance]];
    } else {
        // Fallback on earlier versions
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    } // Uses os_log

    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    
}

@end
