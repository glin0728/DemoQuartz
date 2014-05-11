//
//  HomeViewController.h
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawColorView;

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegment;
@property (weak, nonatomic) IBOutlet DrawColorView *contentView;

- (IBAction)colorChanged:(id)sender;
- (IBAction)shapeChanged:(id)sender;

@end
