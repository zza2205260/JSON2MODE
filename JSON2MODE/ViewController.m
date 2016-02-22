//
//  ViewController.m
//  JSON2MODE
//
//  Created by 昂神 on 16/2/9.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"
#import "NSObject+JSON2MODE.h"
#import "mode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSData *fileData = [[NSData alloc]init];
    
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
    fileData = [NSData dataWithContentsOfFile:path];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:fileData
                          options:kNilOptions
                          error:&error];
    
    NSLog(@"json解析开始");
    masterMode * data = [masterMode new];
    [data JSON2MODE:json];
    
    
    NSMutableArray * array = [NSMutableArray new];
    for (int i = 0 ; i < data.data.count; i++) {
        mode * m = [mode new];
        [m JSON2MODE:data.data[i]];
        
        [array addObject:m];
    }
    NSLog(@"json解析结束");
    
    mode * _m = array[0];
    NSDictionary * d  = [_m MODE2JSON];
    NSLog(@"%@",d);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
