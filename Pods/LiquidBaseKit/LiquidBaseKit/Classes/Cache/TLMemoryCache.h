//
//  TLMemoryCache.h
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLMemoryCache : NSObject


/// 将数据写入内存
/// @param data 数据
/// @param key 键值
+ (void)writeData:(id) data forKey:(NSString *)key;


/// 从内存中读取数据
/// @param key 键值
+ (id)readDataWithKey:(NSString *)key;



@end

NS_ASSUME_NONNULL_END
