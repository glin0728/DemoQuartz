//
//  DrawColorView.m
//  DemoQuartzContext
//
//  Created by TopCoder on 5/11/14.
//  Copyright (c) 2014 TCer. All rights reserved.
//

#import "DrawColorView.h"
#import "UIColor+RandomColor.h"

@implementation DrawColorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.currColor = [UIColor redColor];
        self.useRandom = NO;
        if (self.drawImage == nil) {
            self.drawImage = [UIImage imageNamed:@"myPic.gif"];
        }
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.currColor = [UIColor redColor];
        self.useRandom = NO;
        if (self.drawImage == nil) {
            self.drawImage = [UIImage imageNamed:@"myPic.gif"];
        }
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 7.0);
    CGContextSetStrokeColorWithColor(context, self.currColor.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor randomColor].CGColor);
    
    switch (self.shapeType) {
        case KLineShape:
            CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
            CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
            CGContextStrokePath(context);
            break;
            
        case kRectShape:
            CGContextAddRect(context, [self currentRect]);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case kEllipseShape:
            CGContextAddEllipseInRect(context, [self currentRect]);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case KImageShape: {
            CGFloat horizontalOffset = self.drawImage.size.width/2;
            CGFloat verticalOffset = self.drawImage.size.height/2;
            CGPoint drawPoint = CGPointMake(lastTouch.x-horizontalOffset, lastTouch.y-verticalOffset);
            [self.drawImage drawAtPoint:drawPoint];
            break;
        }
            
        default:
            break;
    }
}

- (CGRect)currentRect
{
    return CGRectMake(firstTouch.x, firstTouch.y,
                      lastTouch.x-firstTouch.x, lastTouch.y-firstTouch.y);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.useRandom) {
        self.currColor = [UIColor randomColor];
    }
    
    UITouch* touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    lastTouch = [touch locationInView:self];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    
    if (self.shapeType == KImageShape) {
        CGFloat horizontalLen = self.drawImage.size.width;
        CGFloat verticalLen = self.drawImage.size.height;
        CGRect drawRect = CGRectMake(lastTouch.x-horizontalLen/2, lastTouch.y-verticalLen/2,
                                     horizontalLen, verticalLen);
        redrawRect = CGRectUnion(redrawRect, drawRect);
        
    } else {
        redrawRect = CGRectUnion(redrawRect, [self currentRect]);
    }
    
    [self setNeedsDisplayInRect:redrawRect];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    
    if (self.shapeType == KImageShape) {
        CGFloat horizontalLen = self.drawImage.size.width;
        CGFloat verticalLen = self.drawImage.size.height;
        CGRect drawRect = CGRectMake(lastTouch.x-horizontalLen/2, lastTouch.y-verticalLen/2,
                                     horizontalLen, verticalLen);
        redrawRect = CGRectUnion(redrawRect, drawRect);
        
    } else {
        redrawRect = CGRectUnion(redrawRect, [self currentRect]);
    }
    
    redrawRect = CGRectInset(redrawRect, -2.0f, -2.0f);
    [self setNeedsDisplayInRect:redrawRect];
}

@end
