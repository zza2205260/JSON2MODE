//
//  NSMutableArray+MODEProperty.m
//  JSON2MODE
//
//  Created by 昂神 on 16/2/17.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "NSMutableArray+MODEProperty.h"
#import "objc/runtime.h"

@implementation NSMutableArray (MODEProperty)
-(void)GetObjPro:(NSObject *) mode{
    
    if (!self || !mode) {
        
        NSLog(@"WARING : MODE IS NULL , %s" , __FUNCTION__);
        
        return;
    }
    
    unsigned int count;
    objc_property_t * properties = class_copyPropertyList([mode class], &count);
    
    if (count == 0) {
        
        NSLog(@"WARING : MODE PROPERTY IS EMEPTY , %s",__FUNCTION__);
        
        return;
    }
    
    // 获取类属性列表
    for (int i = 0 ; i < count; i++) {
        objc_property_t * property = &properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(*property)];
        [self addObject:name];
    }
    
    
}

@end
