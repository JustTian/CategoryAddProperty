//
//  NSObject+CategoryAddProperty.m
//  CAShapeLayer_弧形进度条
//
//  Created by tian on 14-4-18.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import "NSObject+CategoryAddProperty.h"
#import <objc/runtime.h>

//#
static const void *StringProperty = &StringProperty;
static const void *IntegerProperty = &IntegerProperty;
@implementation NSObject (CategoryAddProperty)

@dynamic stringProperty;
//set
-(void)setStringProperty:(NSString *)stringProperty{
    
    objc_setAssociatedObject(self, StringProperty, stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
//get
-(NSString *)stringProperty{
    return objc_getAssociatedObject(self, StringProperty);
}


//set
-(void)setIntegerProperty:(NSInteger)integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:integerProperty];
    objc_setAssociatedObject(self, IntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)integerProperty{

    return [objc_getAssociatedObject(self, IntegerProperty) integerValue];
}
@end
