//
//  EEDataBase.m
//  FMDB_Component
//
//  Created by Eric on 2019/4/26.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEDataBase.h"

//#import <FMDatabaseQueue.h>

//@interface EEDataBase ()
//
//@property(nonatomic,strong)NSString *dbName;
//@property(nonatomic,strong)NSString *dirName;
//@property(nonatomic,strong)NSString *dbFilePath;
//@property(nonatomic,strong)NSString *dbUUID;
//
//@end

@implementation EEDataBase


//- (instancetype)initWithName:(NSString *)dbName andDirName:(NSString *)dirName andUUID:(NSString *)uuid{
//    if (self = [super init]) {
//        self.dbName = dbName;
//        self.dirName = dirName;
//        self.dbFilePath = [self getDBPathWithDBName:dbName andDirName:dirName];
//        self.dbUUID = uuid;
//        self.handlers = [[NSMutableArray alloc] initWithCapacity:5];
//    }
//    return self;
//}
//
//- (NSString *)getDataBaseName{
//    return self.dbName;
//}
//
//- (NSString *)getDataBaseFilePath{
//    return self.dbFilePath;
//}
//
//- (NSString *)getDataBaseUUID{
//    return self.dbUUID;
//}
//
//#pragma mark - < 内部方法 >
//
//- (NSString *)getDBPathWithDBName:(NSString *)dbName andDirName:(NSString *)dirName{
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentDirectory = [paths objectAtIndex:0];
//    
//    NSString *dbFileDirPath = documentDirectory;
//    if (dirName && dirName.length>0) {
//        dbFileDirPath = [documentDirectory stringByAppendingPathComponent:dirName];
//        //如果文件夹不存在,创建文件夹
//        if (![[NSFileManager defaultManager] fileExistsAtPath:dbFileDirPath]) {
//            [[NSFileManager defaultManager] createDirectoryAtPath:dbFileDirPath withIntermediateDirectories:NO attributes:nil error:nil];
//        }
//    }
//    
//    NSString *dbFilePath = [dbFileDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",dbName]];
//    
//    return dbFilePath;
//}

@end
