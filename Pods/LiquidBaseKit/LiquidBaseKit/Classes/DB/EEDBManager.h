//
//  EEDBManager.h
//  FMDB_Component
//
//  Created by Eric on 2019/4/26.
//  Copyright © 2019 Eric. All rights reserved.
//


/**
 * EEDBManager使用单例模式，统一处理数据库相关操作
 */

#import <Foundation/Foundation.h>

//@class EEDataBase;
//
//@protocol EEDBHandlerProtocol <NSObject>
//
//@required
//
//- (BOOL)createTabel;
//
//- (BOOL)updateTable:(NSInteger)nowVersion;
//
//@end

NS_ASSUME_NONNULL_BEGIN

@interface EEDBManager : NSObject 

//+ (instancetype)shareInstance;
//
//#pragma mark - < 数据库操作方法 >
//
///**
// 创建数据库
//
// @param eeDataBase 数据库实例
// @return 结果
// */
//- (BOOL)initDB:(EEDataBase *)eeDataBase;
//
///**
// 关闭数据库
//
// @param dbUUID 数据库唯一标识
// @return 结果
// */
//- (BOOL)closeDBWithDBUUID:(NSString *)dbUUID;
//
///**
// 删除数据库
//
// @param dbUUID 数据库唯一标示
// @return 结果
// */
//- (BOOL)removeDBWithDBUUID:(NSString *)dbUUID;
//
///**
// 添加数据库对应表操作对象
//
// @param obj 需要操作表的对象(添加的对象，必须实现EEDBHandlerPortocol协议)
// @param uuid 数据库唯一标识
// */
//- (void)addHandlerWithClassName:(id)obj andDBUUID:(NSString *)uuid;
//
///**
// 通知数据库，创建表
//
// @param uuid 数据库唯一标识
// */
//- (void)createTableWithDBUUID:(NSString *)uuid;
//
//
///**
// 通知数据库, 升级表
//
// @param uuid 数据库唯一标示
// @param nowVersion 当前数据库版本号
// */
//- (void)updateTabelWithDBUUI:(NSString *)uuid andNowVersion:(NSInteger)nowVersion;
//
///**
// 获取数据库
//
// @param uuid 数据库唯一标识
// @return 数据库
// */
//- (EEDataBase *)getDataBaseByUUID:(NSString *)uuid;
//
//
@end

NS_ASSUME_NONNULL_END
