//
//  mode.h
//  JSON2MODE
//
//  Created by 昂神 on 16/2/17.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface masterMode : NSObject
@property (nonatomic , strong) NSArray * data;
@end




@interface mode : NSObject
@property (nonatomic , strong) NSString * videoId;
@property (nonatomic , strong) NSString * name;
@property (nonatomic , assign) int length;
@property (nonatomic , strong) NSString * videoURL;
@property (nonatomic , strong) NSString * imageURL;
@property (nonatomic , strong) NSString * desc;
@property (nonatomic , strong) NSString * teacher;
@end
