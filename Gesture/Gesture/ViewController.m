//
//  ViewController.m
//  Gesture
//
//  Created by Apple on 15/04/14.
//  Copyright (c) 2014 Ndot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(TestPan:)];

    _bananaImg.userInteractionEnabled = YES;
    pan.delegate = self;
    
    //[pan addTarget:self action:@selector(TestPan:)];
    [_bananaImg addGestureRecognizer:pan];
    
//    UIButton *add = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    add.frame = CGRectMake(10, 10, 100, 50);
//    [add addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:add];
    _deleteView.frame = CGRectMake(0, 0, 0, 0);
    
    _bananaImg.layer.cornerRadius = 25.0;
    _bananaImg.clipsToBounds = YES;
    _bananaImg.layer.borderWidth = 2.0;
    _bananaImg.layer.borderColor = [UIColor redColor].CGColor;
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    /*_top_img.frame = CGRectMake(0, 0, 320, 287);
   [UIView animateWithDuration:2.0 animations:^{
       _top_img.frame = CGRectMake(0, 0, 320, 0);
   }];
    
     
    _bottom_img.frame = CGRectMake(0, 230, 320, 338);
    [UIView animateWithDuration:2.0 animations:^{
        _bottom_img.frame = CGRectMake(0, 568, 320, 0);
    }];*/
    CGRect basketTopFrame = self.top_img.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = self.bottom_img.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    self.top_img.frame = basketTopFrame;
    self.bottom_img.frame = basketBottomFrame;
    
    [UIView commitAnimations];
}
-(void)test
{
    
    _deleteView.frame = CGRectMake(0, 568, 320, 103);
    [UIView animateWithDuration:0.50 animations:^{
        _deleteView.frame = CGRectMake(0, 465, 320, 103);
    }];
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"Move");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"End");
}
-(void)TestPan:(UIPanGestureRecognizer *)reg
{
    //NSLog(@"TestPan");
    CGPoint translation = [reg translationInView:self.view];
    //NSLog(@"translation:%f %f",translation.x,translation.y);
    NSLog(@"recognizer:%f %f",reg.view.frame.origin.x,reg.view.frame.origin.y);
    
    reg.view.center = CGPointMake(reg.view.center.x + translation.x,
                                         reg.view.center.y + translation.y);
    if(reg.view.frame.origin.y >= 420.0)
    {
        [self test];
    }
    
    if(reg.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"EEE");
        if(reg.view.frame.origin.y >= 420.0)
        {
            //[_bananaImg removeFromSuperview];
            
            _bananaImg.frame = CGRectMake(reg.view.frame.origin.x,reg.view.frame.origin.y, _bananaImg.frame.size.width, _bananaImg.frame.size.height);
            [UIView animateWithDuration:0.50 animations:^{
                _bananaImg.frame = CGRectMake(reg.view.frame.origin.x, 568, _bananaImg.frame.size.width, _bananaImg.frame.size.height);
            }];
            _deleteView.frame = CGRectMake(0, 465, 320, 103);
            [UIView animateWithDuration:0.50 animations:^{
                _deleteView.frame = CGRectMake(0, 568, 320, 103);
            }];
        }
    }
    [reg setTranslation:CGPointMake(0, 0) inView:self.view];

}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
//    NSLog(@"click");
    
    CGPoint translation = [recognizer translationInView:self.view];
    //NSLog(@"translation:%f %f",translation.x,translation.y);
    NSLog(@"recognizer:%f %f",recognizer.view.frame.origin.x,recognizer.view.frame.origin.y);
    
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
    /*if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
    }*/
    
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
