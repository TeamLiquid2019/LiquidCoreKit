//
//  TLNetworking.m
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import "TLNetworking.h"

#import <AFNetworking.h>

@implementation NSURLRequest (Equal)
//判断是否是同一个请求（依据是请求url和参数是否相同）
- (BOOL)isTheSameRequest:(NSURLRequest *)request {
    if ([self.HTTPMethod isEqualToString:request.HTTPMethod]) {
        if ([self.URL.absoluteString isEqualToString:request.URL.absoluteString]) {
            if ([self.HTTPBody isEqualToData:request.HTTPBody]) {
                NSLog(@"同一个请求还没执行完，又来请求☹️");
                return YES;
            }
        }
    }
    return NO;
}

@end

@interface TLNetworking ()<NSCopying,NSMutableCopying>

@property(nonatomic,copy)NSMutableDictionary *headers;
@property(nonatomic,copy)NSMutableArray *requestTasksPool;//请求任务池
@property(nonatomic,strong)AFHTTPSessionManager *sessionManager;
@property(nonatomic,assign)NSTimeInterval timeOut;//超时时间

@end

@implementation TLNetworking

#pragma mark - < 单例 >

+ (instancetype)sharedInstance{
    static TLNetworking *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:nil] init];
        _instance.timeOut = 10;//超时时间默认10秒
    });
    return _instance;
}

+(id)allocWithZone:(NSZone *)zone{
    return [TLNetworking sharedInstance];
}

-(id)copyWithZone:(NSZone *)zone{
    return [TLNetworking sharedInstance];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [TLNetworking sharedInstance];
}

#pragma mark - < 外部方法 >

- (NSArray *)currentRunningTasks{
    return [self.requestTasksPool copy];
}

- (void)configHttpHeader:(NSMutableDictionary *)httpHeader{
    [self.headers removeAllObjects];
    [self.headers setDictionary:httpHeader];
}

#pragma mark - < 请求方法 >

- (TLURLSessionTask *)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params cache:(BOOL)cache progressBlock:(TLGetProgress)progressBlock successBlock:(TLResponseSuccessBlock)successBlock failBlock:(TLResponseFailBlock)failBlock{
    __block TLURLSessionTask *sessionTask = nil;
    AFHTTPSessionManager *manager = [self getSessionManager];
    
#warning --网络验证和缓存暂时不做--
    //网络验证
//    if (networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
//        if (failBlock) {
//            failBlock(ZB_ERROR);
//        }
//        return session;
//    }
    
//    id responseObj = [[ZBCacheManager shareManager] getCacheResponseObjectWithRequestUrl:url params:params];
//    if (responseObj && cache) {
//        if (successBlock) {
//            successBlock(responseObj);
//        }
//    }
    
    sessionTask = [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progressBlock) {
            progressBlock(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
#warning --缓存暂时不做--
        if (cache == YES) {
            
        }
        if ([self.requestTasksPool containsObject:sessionTask]) {
            [self.requestTasksPool removeObject:task];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(error);
        }
        if ([self.requestTasksPool containsObject:sessionTask]) {
            [self.requestTasksPool removeObject:task];
        }
    }];
    
    //判断重复请求，如果有重复请求，取消新的请求
    if ([self isSameRequest:sessionTask]) {
        [sessionTask cancel];
        return sessionTask;
    }else{
        [self.requestTasksPool addObject:sessionTask];
        [sessionTask resume];
        return sessionTask;
    }
}

- (TLURLSessionTask *)postWithUrl:(NSString *)url params:(NSMutableDictionary *)params cache:(BOOL)cache progressBlock:(TLPostProgress)progressBlock successBlock:(TLResponseSuccessBlock)successBlock failBlock:(TLResponseFailBlock)failBlock{
    __block TLURLSessionTask *sessionTask = nil;
    AFHTTPSessionManager *manager = [self getSessionManager];
    #warning --网络验证和缓存暂时不做--
        //网络验证
    //    if (networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
    //        if (failBlock) {
    //            failBlock(ZB_ERROR);
    //        }
    //        return session;
    //    }
        
    //    id responseObj = [[ZBCacheManager shareManager] getCacheResponseObjectWithRequestUrl:url params:params];
    //    if (responseObj && cache) {
    //        if (successBlock) {
    //            successBlock(responseObj);
    //        }
    //    }
    
    sessionTask = [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressBlock) {
            progressBlock(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
        #warning --缓存暂时不做--
        if (cache == YES) {
                
        }
        if ([self.requestTasksPool containsObject:sessionTask]) {
            [self.requestTasksPool removeObject:task];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(error);
        }
        if ([self.requestTasksPool containsObject:sessionTask]) {
            [self.requestTasksPool removeObject:task];
        }
    }];
    
    //判断重复请求，如果有重复请求，取消新的请求
    if ([self isSameRequest:sessionTask]) {
        [sessionTask cancel];
        return sessionTask;
    }else{
        [self.requestTasksPool addObject:sessionTask];
        [sessionTask resume];
        return sessionTask;
    }
    
}

#pragma mark - < 内部方法 >

- (BOOL)isSameRequest:(TLURLSessionTask *)task{
    __block BOOL isSame = NO;
    [[self currentRunningTasks] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TLURLSessionTask *inPoolTask = (TLURLSessionTask *)obj;
        if ([inPoolTask.originalRequest isTheSameRequest:task.originalRequest]) {
            isSame = YES;
            *stop = YES;
        }
    }];
    return isSame;
}

#pragma mark - < Lazy Load >

- (NSMutableDictionary *)getHeaders{
    if (_headers == nil) {
        _headers = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return _headers;
}

- (NSMutableArray *)getRequestTasksPool{
    if (_requestTasksPool == nil) {
        _requestTasksPool = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return _requestTasksPool;
}

- (AFHTTPSessionManager *)getSessionManager{
    if (_sessionManager ==  nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        //默认解析模式
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        
        //配置响应序列化
//        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", @"application/octet-stream", @"application/zip"]];
    }
    
    _sessionManager.requestSerializer.timeoutInterval = _timeOut;
    
    //每次请求时，设置Header
    for (NSString *key in self.headers.allKeys) {
        if (self.headers[key] != nil) {
            [_sessionManager.requestSerializer setValue:self.headers[key] forHTTPHeaderField:key];
        }
    }
    
#warning --将来要加缓存--
    //每次网络请求的时候，检查此时磁盘中的缓存大小，阈值默认是40MB，如果超过阈值，则清理LRU缓存,同时也会清理过期缓存，缓存默认SSL是7天，磁盘缓存的大小和SSL的设置可以通过该方法[ZBCacheManager shareManager] setCacheTime: diskCapacity:]设置
//    [[ZBCacheManager shareManager] clearLRUCache];
    return _sessionManager;
}




@end



