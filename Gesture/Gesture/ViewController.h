//
//  ViewController.h
//  Gesture
//
//  Created by Apple on 15/04/14.
//  Copyright (c) 2014 Ndot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *bottom_img;
@property (strong, nonatomic) IBOutlet UIImageView *top_img;
@property (strong, nonatomic) IBOutlet UIView *deleteView;
@property (strong, nonatomic) IBOutlet UIImageView *bananaImg;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handlePin:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;

@end
