//
//  HomeViewController.m
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import "HomeViewController.h"
#import "DemoColorDefine.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorChanged:(id)sender
{
}

- (IBAction)shapeChanged:(id)sender
{
}
@end