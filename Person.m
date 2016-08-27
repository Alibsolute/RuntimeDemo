//
//  Person.m
//  RuntimeDemo
//
//  Created by ABS on 16/2/26.
//  Copyright © 2016年 ABS. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person
//默认方法都有两个隐式参数
void runtimeTest(id self,SEL sel) {
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}

//当一个对象调用为实现的方法,会调用这个方法处理,并且会吧对应的方法列表传过来
//刚好可以用来判断,为实现的方法是不是我们想要的动态方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //动态添加eat方法
    //第一个参数:给那个类添加方法
    //第二个参数:添加方法的方法编号
    //第三个参数:添加方法的函数实现(函数地址)
    //第四个参数:函数的类型,返回值+参数类型 v->void @->对象->self :->SEL->_cmd
    if (sel == @selector(noThisMethod)) {
        class_addMethod(self, @selector(noThisMethod), runtimeTest, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}
@end