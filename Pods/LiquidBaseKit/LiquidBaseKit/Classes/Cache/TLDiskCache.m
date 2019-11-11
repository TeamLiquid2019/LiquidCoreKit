//
//  TLDiskCache.m
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import "TLDiskCache.h"

@interface TLDiskCache ()<NSCopying,NSMutableCopying>

@end

static TLDiskCache *_instance = nil;

@implementation TLDiskCache

+ (instancetype)shareDiskCache{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [TLDiskCache shareDiskCache];
}

-(id)copyWithZone:(NSZone *)zone{
    return [TLDiskCache shareDiskCache];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [TLDiskCache shareDiskCache];
}


/// 将数据写入磁盘
/// @param data 数据
/// @param directory 目录
/// @param filename 文件名
- (void)writeData:(id)data toDir:(NSString *)directory filename:(NSString *)filename{
    assert(data);
    assert(directory);
    assert(filename);
    
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (error) {
        NSLog(@"TLDiskCache %@ error is %@",NSStringFromSelector(_cmd),error.localizedDescription);
        return;
    }
    
    NSString *filePath = [directory stringByAppendingPathComponent:filename];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
    
}

/// 从磁盘读取数据
/// @param directory 目录
/// @param filename 文件名
- (id)readDataFromDir:(NSString *)directory filename:(NSString *)filename{
    assert(directory);
    assert(filename);
    
    NSData *data = nil;
    NSString *filePath = [directory stringByAppendingPathComponent:filename];
    data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    return data;
}

/// 获取目录文件总大小
/// @param directory 目录名
- (NSUInteger)dataSizeInDir:(NSString *)directory{
    if (!directory) {
        return 0;
    }
    BOOL isDir = NO;
    NSUInteger total = 0;
    if ([[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:&isDir]) {
        if (isDir) {
            NSError *error = nil;
            NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directory error:&error];
            if (!error) {
                for (NSString *subFile in array) {
                    NSString *filePath = [directory stringByAppendingPathComponent:subFile];
                    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
                    
                    if (!error) {
                        total += [attributes[NSFileSize] unsignedIntegerValue];
                    }
                }
            }
        }
    }
    return total;
}

/// 清空目录中文件
/// @param directory 目录
- (void)clearDataInDir:(NSString *)directory{
    if (directory) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:nil]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:directory error:&error];
            if (error) {
                NSLog(@"TLDiskCache %@：%@",NSStringFromSelector(_cmd),error.localizedDescription);
            }
        }
    }
}

/// 删除单个文件
/// @param fileUrl 文件路径
- (void)deleteCache:(NSString *)fileUrl{
    if (fileUrl) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileUrl]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:fileUrl error:&error];
            if (error) {
                NSLog(@"TLDiskCache %@ - %@.",NSStringFromSelector(_cmd),error.localizedDescription);
            }
        }else {
            NSLog(@"TLDiskCache %@ - File Not exist.",NSStringFromSelector(_cmd));
        }
    }
}

@end
