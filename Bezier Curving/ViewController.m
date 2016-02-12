//
//  ViewController.m
//  Bezier Curving
//
//  Created by Hamish Knight on 12/02/2016.
//  Copyright © 2016 Redonkulous Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    CAShapeLayer* yourShapeLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat sf = self.view.frame.size.width/500.0; // The factor to scale the path by
    
    UIBezierPath* yourPath = [UIBezierPath bezierPath]; // create the bezier path
    [yourPath moveToPoint:CGPointMake(10.0*sf, 10.0*sf)]; // move to your starting point
    [yourPath addQuadCurveToPoint:CGPointMake(300.0*sf, 500.0*sf) controlPoint:CGPointMake(500.0*sf, 350.0*sf)];

    
    yourShapeLayer = [CAShapeLayer layer]; // create your shape layer
    
    yourShapeLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    yourShapeLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width); // assign it's frame
    
    yourShapeLayer.position = self.view.center; // centers the layer in the view

    yourShapeLayer.path = yourPath.CGPath; // add your path to the shape layer
    yourShapeLayer.fillColor = [UIColor clearColor].CGColor; // prevent the shape layer from filling
    yourShapeLayer.strokeColor = [UIColor redColor].CGColor; // red stroke color
    yourShapeLayer.lineWidth = 5.0; // 5 point stroke width
    [self.view.layer addSublayer:yourShapeLayer]; // add the shape layer to the view
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    yourShapeLayer.strokeStart = 0.0;
    CABasicAnimation* strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    strokeAnim.duration = 2.0;
    strokeAnim.fromValue = @(0.0);
    strokeAnim.toValue = @(1.0);
    [yourShapeLayer addAnimation:strokeAnim forKey:@"strokeAnim"];
    
}

@end
