//
//  NSObject+JSON2MODE.h
//  JSON2MODE
//
//  Created by 昂神 on 16/2/16.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON2MODE)
-(instancetype)JSON2MODE:(NSDictionary *) json; // > json 转 类
-(NSMutableDictionary *)MODE2JSON; // 类 转 json
@end
