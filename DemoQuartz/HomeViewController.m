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
#import "UIColor+RandomColor.h"

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
    [self.contentView addObserver:self
                       forKeyPath:@"currColor"
                          options:NSKeyValueObservingOptionNew
                          context:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:3
                                     target:self
                                   selector:@selector(timerHandler)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)dealloc
{
    [self.contentView removeObserver:self forKeyPath:@"currColor"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == self.contentView && [keyPath isEqualToString:@"currColor"]) {
        UIColor* color = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"observeValueForKeyPath Invoked, Color:%@", color);
        [self.contentView setNeedsDisplay];
    }
}

- (void)timerHandler
{
    self.contentView.currColor = [UIColor randomColor];
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
