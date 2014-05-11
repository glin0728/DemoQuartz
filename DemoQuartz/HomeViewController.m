//
//  HomeViewController.m
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import "HomeViewController.h"
#import "DemoColorDefine.h"
#import "DrawColorView.h"

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
    UISegmentedControl* segmentVC = sender;
    DrawColorView* drawColorView = (DrawColorView *)self.contentView;
    NSInteger index = [segmentVC selectedSegmentIndex];
    switch (index) {
        case kRedColorTab:
            drawColorView.currColor = [UIColor redColor];
            drawColorView.useRandom = NO;
            break;
        case kBlueColorTab:
            drawColorView.currColor = [UIColor blueColor];
            drawColorView.useRandom = NO;
            break;
        case kYellowColorTab:
            drawColorView.currColor = [UIColor yellowColor];
            drawColorView.useRandom = NO;
            break;
        case kGreenColorTab:
            drawColorView.currColor = [UIColor greenColor];
            drawColorView.useRandom = NO;
            break;
        case kRandomColorTab:
            drawColorView.useRandom = YES;
            break;
        default:
            break;
    }
}

- (IBAction)shapeChanged:(id)sender
{
    UISegmentedControl* segmentVC = sender;
    DrawColorView* drawColorView = (DrawColorView *)self.contentView;
    switch (segmentVC.selectedSegmentIndex) {
        case KLineShape:
            drawColorView.shapeType = KLineShape;
            break;
            
        case kRectShape:
            drawColorView.shapeType = kRectShape;
            break;
            
        case kEllipseShape:
            drawColorView.shapeType = kEllipseShape;
            break;
            
        case KImageShape:
            drawColorView.shapeType = KImageShape;
            drawColorView.drawImage = [UIImage imageNamed:@"iphone.png"];
            break;
            
        default:
            break;
    }
    
    if (segmentVC.selectedSegmentIndex == KImageShape) {
        self.colorSegment.hidden = YES;
    } else {
        self.colorSegment.hidden = NO;
    }
}

@end
