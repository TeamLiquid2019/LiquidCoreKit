//
//  TLDiskCache.h
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLDiskCache : NSObject

+ (instancetype)shareDiskCache;

/// 将数据写入磁盘
/// @param data 数据
/// @param directory 目录
/// @param filename 文件名
- (void)writeData:(id)data toDir:(NSString *)directory filename:(NSString *)filename;

/// 从磁盘读取数据
/// @param directory 目录
/// @param filename 文件名
- (id)readDataFromDir:(NSString *)directory filename:(NSString *)filename;

/// 获取目录文件总大小
/// @param directory 目录名
- (NSUInteger)dataSizeInDir:(NSString *)directory;

/// 清空目录中文件
/// @param directory 目录
- (void)clearDataInDir:(NSString *)directory;

/// 删除单个文件
/// @param fileUrl 文件路径
- (void)deleteCache:(NSString *)fileUrl;

@end

NS_ASSUME_NONNULL_END
