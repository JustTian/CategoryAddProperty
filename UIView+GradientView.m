//
//  UIView+GradientView.m
//  CAShapeLayer_弧形进度条
//
//  Created by tian on 14-4-18.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import "UIView+GradientView.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

static const void *StartColor = &StartColor;
static const void *EndColor = &EndColor;
static const void *Locations = &Locations;
static const void *Colors = &Colors;
@implementation UIView (GradientView)

@dynamic locations;

//
- (void)setLocations:(NSArray *)locations{
    
    objc_setAssociatedObject(self, Locations, locations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (NSArray *)locations{
    
    return  objc_getAssociatedObject(self, Locations);
}
//
- (void)setColors:(NSArray *)colors{
    objc_setAssociatedObject(self, Colors, colors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)colors{
    return  objc_getAssociatedObject(self, Colors);
}

-(CAGradientLayer *)shadowAsInverse{
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    CGRect newShadowFrame =self.frame;
    
    newShadow.frame = newShadowFrame;
   
    if (self.locations.count) {
        newShadow.locations = self.locations;
    }
    NSMutableArray *muColors = [[NSMutableArray alloc]initWithCapacity:self.colors.count];
    
    //添加渐变的颜色组合
    if (self.colors != nil) {
        for (UIColor *subColor in self.colors) {
            [muColors addObject:(id)[subColor CGColor]];
        }
    }

    newShadow.colors = muColors;
    
    return newShadow;
}
@end
