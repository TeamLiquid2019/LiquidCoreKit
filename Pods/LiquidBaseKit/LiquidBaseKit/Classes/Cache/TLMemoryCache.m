//
//  TLMemoryCache.m
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import "TLMemoryCache.h"
#import <UIKit/UIKit.h>

static NSCache *shareCache;

@implementation TLMemoryCache

+ (NSCache *)shareCache {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shareCache == nil) {
            shareCache = [[NSCache alloc] init];
        }
        
        //当收到内存警报时，清空内存缓存
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [shareCache removeAllObjects];
        }];
    });
    return shareCache;
}


/// 将数据写入内存
/// @param data 数据
/// @param key 键值
+ (void)writeData:(id) data forKey:(NSString *)key{
    assert(data);
    assert(key);
    
    NSCache *cache = [TLMemoryCache shareCache];
    [cache setObject:data forKey:key];
}


/// 从内存中读取数据
/// @param key 键值
+ (id)readDataWithKey:(NSString *)key{
    assert(key);
    id data = nil;
    NSCache *cache = [TLMemoryCache shareCache];
    data = [cache objectForKey:key];
    return data;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}

@end
