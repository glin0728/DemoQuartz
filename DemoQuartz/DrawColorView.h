//
//  DrawColorView.h
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoColorDefine.h"

@interface DrawColorView : UIView
{
    CGPoint firstTouch;
    CGPoint lastTouch;
    CGRect redrawRect;
}

@property(nonatomic, assign) ShapeType shapeType;
@property(nonatomic, assign) BOOL useRandom;
@property(nonatomic, strong) UIImage* drawImage;
@property(nonatomic, strong) UIColor* currColor;

@end
