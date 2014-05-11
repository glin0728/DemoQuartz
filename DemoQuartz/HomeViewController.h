//
//  HomeViewController.h
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegment;

- (IBAction)colorChanged:(id)sender;
- (IBAction)shapeChanged:(id)sender;

@end
