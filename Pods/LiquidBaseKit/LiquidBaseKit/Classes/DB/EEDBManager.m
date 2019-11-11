//
//  EEDBManager.m
//  FMDB_Component
//
//  Created by Eric on 2019/4/26.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEDBManager.h"

//#import "EEDataBase.h"
//#import <FMDatabase.h>
//#import <FMDatabaseQueue.h>

//@interface EEDBManager ()
//
///**
// 存储所有db容器,value = db ,key = dbUUID;
// */
//@property(nonatomic,strong)NSMutableDictionary *dbDic;
//
//@end

@implementation EEDBManager

//#pragma mark - < 单例模式 >
//
//static EEDBManager *_instance = nil;
//
//+ (instancetype)shareInstance{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [[super allocWithZone:NULL] init];
//    });
//    return _instance;
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    return [EEDBManager shareInstance];
//}
//
//- (id)copyWithZone:(NSZone *)zone{
//    return [EEDBManager shareInstance];
//}
//
//- (id)mutableCopyWithZone:(NSZone *)zone{
//    return [EEDBManager shareInstance];
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.dbDic = [[NSMutableDictionary alloc] initWithCapacity:5];
//    }
//    return self;
//}
//
//#pragma mark - < 数据库操作方法 >
//
///**
// 创建数据库
// 
// @param eeDataBase 数据库实例
// @return 结果
// */
//- (BOOL)initDB:(EEDataBase *)eeDataBase{
//    if (eeDataBase == nil) {
//        [self EEDBLog:@"创建数据库不能为空"];
//        return NO;
//    }
//    
//    [self EEDBLog:[NSString stringWithFormat:@"创建数据库 : %@ dbPath : %@",[eeDataBase getDataBaseName],[eeDataBase getDataBaseFilePath]]];
//
//    //如果不存在
//    if ([self.dbDic objectForKey:[eeDataBase getDataBaseUUID]] == nil) {
//        if (eeDataBase.dbQueue == nil) {
//            eeDataBase.dbQueue = [FMDatabaseQueue databaseQueueWithPath:[eeDataBase getDataBaseFilePath]];
//        }
//        [self.dbDic setObject:eeDataBase forKey:[eeDataBase getDataBaseUUID]];
//        
//        [self EEDBLog:[NSString stringWithFormat:@"数据库 : %@ 创建完毕，并打开了",[eeDataBase getDataBaseName]]];
//    }else{
//        [self EEDBLog:[NSString stringWithFormat:@"数据库 : %@ 已经打开，不要重复调用",[eeDataBase getDataBaseName]]];
//    }
//    return YES;
//}
//
///**
// 关闭数据库
// 
// @param dbUUID 数据库唯一标识
// @return 结果
// */
//- (BOOL)closeDBWithDBUUID:(NSString *)dbUUID{
//    EEDataBase *db = [self.dbDic objectForKey:dbUUID];
//    if (db) {
//        [db.dbQueue close];
//        [self.dbDic removeObjectForKey:dbUUID];
//    }
//    return YES;
//}
//
///**
// 删除数据库
// 
// @param dbUUID 数据库唯一标示
// @return 结果
// */
//- (BOOL)removeDBWithDBUUID:(NSString *)dbUUID{
//    NSString *dbFilePath = [[self.dbDic objectForKey:dbUUID] getDataBaseFilePath];
//    [self closeDBWithDBUUID:dbUUID];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:dbFilePath]) {
//        [[NSFileManager defaultManager] removeItemAtPath:dbFilePath error:nil];
//    }
//    return YES;
//}
//
///**
// 添加数据库对应表操作对象
// 
// @param obj 需要操作表的对象(添加的对象，必须实现EEDBHandlerPortocol协议)
// @param uuid 数据库唯一标识
// */
//- (void)addHandlerWithClassName:(id)obj andDBUUID:(NSString *)uuid{
//    EEDataBase *db = [self.dbDic objectForKey:uuid];
//    if (db) {
//        [db.handlers addObject:obj];
//    }
//}
//
///**
// 通知数据库，创建表
// 
// @param uuid 数据库唯一标识
// */
//- (void)createTableWithDBUUID:(NSString *)uuid{
//    EEDataBase *db = [self.dbDic objectForKey:uuid];
//    for (id<EEDBHandlerProtocol> handler in db.handlers) {
//        [handler createTabel];
//    }
//}
//
///**
// 通知数据库, 升级表
// 
// @param uuid 数据库唯一标示
// @param nowVersion 当前数据库版本号
// */
//- (void)updateTabelWithDBUUI:(NSString *)uuid andNowVersion:(NSInteger)nowVersion{
//    EEDataBase *db = [self.dbDic objectForKey:uuid];
//    for (id<EEDBHandlerProtocol> handler in db.handlers) {
//        [handler updateTable:nowVersion];
//    }
//}
//
///**
// 获取数据库
// 
// @param uuid 数据库唯一标识
// @return 数据库
// */
//- (EEDataBase *)getDataBaseByUUID:(NSString *)uuid{
//    return [self.dbDic objectForKey:uuid];
//}
//
//
//
//
//#pragma mark - < Log >
//
//
//- (void)EEDBLog:(NSString *)msg{
//    NSLog(@"============ EEDBLog =============\r\n");
//    NSLog(@"=\r\n");
//    NSLog(@"=\r\n");
//    
//    NSLog(@"= Log: %@",msg);
//    
//    NSLog(@"=\r\n");
//    NSLog(@"=\r\n");
//    NSLog(@"========== EEDBLog End ===========\r\n");
//}

@end
