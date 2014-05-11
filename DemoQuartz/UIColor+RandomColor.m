//
//  UIColor+RandomColor.m
//  DemoQuartz
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        srandom(time(NULL));
    });
    
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:1.0f];
}

@end
