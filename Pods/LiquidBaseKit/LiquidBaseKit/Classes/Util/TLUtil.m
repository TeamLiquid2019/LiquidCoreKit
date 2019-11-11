//
//  TLUtil.m
//
//  Created by Eric on 2019/4/22.
//

#import "TLUtil.h"

@implementation TLUtil

+ (NSString*) getUUIDString {
    return [self bytes2HexString:[self getUUIDData]];
}

+ (NSData *) getUUIDData {
    CFUUIDRef UUID = CFUUIDCreate(kCFAllocatorDefault);
    CFUUIDBytes bytes = CFUUIDGetUUIDBytes(UUID);
    NSData *result = [[NSData alloc] initWithBytes:&bytes length:sizeof(bytes)];
    CFRelease(UUID);
    return result;
}

+ (NSString*)bytes2HexString:(NSData *)data {
    if (data == nil)
        return nil;
    NSMutableString* hexString = [NSMutableString new];
    unsigned const char* pointer = [data bytes];
    NSUInteger length = [data length];
    for(unsigned short i = 0 ; i < length ; i++)
    {
        [hexString appendFormat:@"%02X", *(pointer++)];
    }
    return hexString;
}



@end
