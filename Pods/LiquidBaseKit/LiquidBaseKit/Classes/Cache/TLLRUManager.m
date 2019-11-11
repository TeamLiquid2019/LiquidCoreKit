//
//  TLLRUManager.m
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import "TLLRUManager.h"

static NSMutableArray *operationQueue = nil;
static NSString *const TLLRUManagerName = @"TLLRUManagerName";
static TLLRUManager *manager = nil;

@implementation TLLRUManager

+ (instancetype)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TLLRUManager alloc] init];
        if ([[NSUserDefaults standardUserDefaults] objectForKey:TLLRUManagerName]) {
            operationQueue = [NSMutableArray arrayWithArray:(NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:TLLRUManagerName]];
        }else {
            operationQueue = [NSMutableArray array];
        }
    });
    return manager;
}

- (void)addFileNode:(NSString *)filename {
    NSArray *array = [operationQueue copy];
    //优化遍历
    NSArray *reverseArray = [[array reverseObjectEnumerator] allObjects];
    
    [reverseArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"fileName"] isEqualToString:filename]) {
            [operationQueue removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    
    NSDate *date = [NSDate date];
    NSDictionary *newDic = @{@"fileName":filename,@"date":date};
    [operationQueue addObject:newDic];
    
    [[NSUserDefaults standardUserDefaults] setObject:[operationQueue copy] forKey:TLLRUManagerName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)refreshIndexOfFileNode:(NSString *)filename {
    [self addFileNode:filename];
}

- (NSArray *)removeLRUFileNodeWithCacheTime:(NSTimeInterval)time {
    NSMutableArray *result = [NSMutableArray array];
    if (operationQueue.count > 0) {
        NSArray *tmpArray = [operationQueue copy];
        [tmpArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDate *date = obj[@"date"];
            NSDate *newDate = [date dateByAddingTimeInterval:time];
            if ([[NSDate date] compare:newDate] == NSOrderedDescending) {
                [result addObject:obj[@"fileName"]];
                [operationQueue removeObjectAtIndex:idx];
            }
        }];
        
        //其实这个逻辑可以不要
        if (result.count == 0) {
            NSString *removeFileName = [operationQueue firstObject][@"fileName"];
            [result addObject:removeFileName];
            [operationQueue removeObjectAtIndex:0];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:[operationQueue copy] forKey:TLLRUManagerName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
    return [result copy];
}


- (NSArray *)currentQueue {
    return [operationQueue copy];
}

@end
