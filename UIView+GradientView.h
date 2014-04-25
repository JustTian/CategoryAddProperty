//
//  UIView+GradientView.h
//  CAShapeLayer_弧形进度条
//
//  Created by tian on 14-4-18.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GradientView)

@property (nonatomic,retain) NSArray *locations;
@property (nonatomic,retain) NSArray *colors;

-(CAGradientLayer *)shadowAsInverse;
@end
