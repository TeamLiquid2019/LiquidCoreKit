//
//  TLNetworking.h
//  Pods
//
//  Created by Eric on 2019/11/9.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

/**
 *  请求任务
 */
typedef NSURLSessionTask TLURLSessionTask;

/**
 *  成功回调
 *
 *  @param response 成功后返回的数据
 */
typedef void(^TLResponseSuccessBlock)(id response);

/**
 *  失败回调
 *
 *  @param error 失败后返回的错误信息
 */
typedef void(^TLResponseFailBlock)(NSError *error);

/**
 *  下载进度
 *
 *  @param bytesRead              已下载的大小
 *  @param totalBytes                总下载大小
 */
typedef void (^TLDownloadProgress)(int64_t bytesRead, int64_t totalBytes);

/**
 *  上传进度
 *  @param bytesWritten              已上传的大小
 *  @param totalBytes                总上传大小
 */
typedef void(^TLUploadProgressBlock)(int64_t bytesWritten, int64_t totalBytes);

typedef TLDownloadProgress TLGetProgress;
typedef TLDownloadProgress TLPostProgress;

@interface TLNetworking : NSObject

+ (instancetype)sharedInstance;

/**
 *  正在运行的网络任务
 *  @return taskArray
 */
- (NSArray *)currentRunningTasks;

/**
*  配置请求头
*  @param httpHeader 请求头
*/
- (void)configHttpHeader:(NSMutableDictionary *)httpHeader;

/**
*  配置manager
*  @param sessionManager manager
*/
- (void)configSessinManager:(AFHTTPSessionManager *)sessionManager;

/**
*  GET请求
*
*  @param url              请求路径
*  @param params           拼接参数
*  @param cache            是否缓存
*  @param progressBlock    进度回调
*  @param successBlock     成功回调
*  @param failBlock        失败回调
*
*  @return 返回的对象中可取消请求
*/
- (TLURLSessionTask *)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params cache:(BOOL)cache progressBlock:(TLGetProgress)progressBlock successBlock:(TLResponseSuccessBlock)successBlock failBlock:(TLResponseFailBlock)failBlock;

/**
*  POST请求
*
*  @param url              请求路径
*  @param params           拼接参数
*  @param cache            是否缓存
*  @param progressBlock    进度回调
*  @param successBlock     成功回调
*  @param failBlock        失败回调
*
*  @return 返回的对象中可取消请求
*/
- (TLURLSessionTask *)postWithUrl:(NSString *)url params:(NSMutableDictionary *)params cache:(BOOL)cache
                    progressBlock:(TLPostProgress)progressBlock successBlock:(TLResponseSuccessBlock)successBlock failBlock:(TLResponseFailBlock)failBlock;


@end

