//
//  ViewController.m
//  RuntimeDemo
//
//  Created by ABS on 16/2/26.
//  Copyright © 2016年 ABS. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

static const char *key = "name";
@implementation Person (name)

- (NSString *)name {
    //根据关联的key,获取关联的值
    return  objc_getAssociatedObject(self, key);
}

- (void)setName:(NSString *)name {
    //第一个参数:给哪个对象添加关联
    //第二个参数:关联的key,通过这个key获取
    //第三个参数:关联的value
    //第四个参数:关联的策略
    //objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(noThisMethod)];
    p.name = @"123456";
    //NSLog(@"%@",p.name);
    
    objc_setAssociatedObject(p, "name", @"123456", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *getStr = objc_getAssociatedObject(p, "name");
    NSLog(@"%@",getStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end