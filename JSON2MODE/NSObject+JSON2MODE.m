//
//  NSObject+JSON2MODE.m
//  JSON2MODE
//
//  Created by 昂神 on 16/2/16.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "NSObject+JSON2MODE.h"
#import "NSMutableArray+MODEProperty.h"
@implementation NSObject (JSON2MODE)
-(instancetype)JSON2MODE:(NSDictionary *) json{
 
    if (!json || json == (id)kCFNull) {
        NSLog(@"WARING : JSON IS NULL   , %s" ,__FUNCTION__);
        return nil;
    }
    
    NSMutableArray * PropertiesName = [NSMutableArray new];
    // 获取类属性列表
    [PropertiesName GetObjPro:self];
    
    NSArray * Keys_  = [json allKeys];
    
    //使用kvc进行自动赋值
    int NameSize = PropertiesName.count;
    for (int j = 0; j < NameSize; j++) {
        NSString * key = PropertiesName[j];
        if ([Keys_ containsObject:key]) {
            [self setValue:[json objectForKey:key] forKey:key];
        }else{
            NSLog(@"WARING : JSON NO %@  ,  %s",key,__FUNCTION__);
        }
    }
    
    return nil;
    
}
-(NSMutableDictionary *)MODE2JSON{
    
    if (!self) {
        NSLog(@"WARING : MODE IS NULL  ,  %s",__FUNCTION__);
        return nil;
    }
    
    NSMutableArray * PropertiesName = [NSMutableArray new];
    // 获取类属性列表
    [PropertiesName GetObjPro:self];
    
    int PropertiesSize =PropertiesName.count;
    if (PropertiesSize ==  0) {
        return nil;
    }
    
    // 动态生成字典
    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    for (int i = 0; i < PropertiesSize; i++) {
        NSString * key = PropertiesName[i];
        [dict setValue:[self valueForKey:key] forKey:key];
    }
    
    return dict;
}



@end
