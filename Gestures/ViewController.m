//
//  ViewController.m
//  Gestures
//
//  Created by Daniel Reid on 3/18/13.
//  Copyright (c) 2013 TitanTV BIM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CGRect _originalRect;
}


@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
    _originalRect = self.imageView.frame;
    
    UIImageView *tempImageView;
    
    tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flower.png"]];
    tempImageView.frame = _originalRect;
    [self.view addSubview:tempImageView];
    
    self.imageView=tempImageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //changed the file
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//enable to become first responder
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake){
        self.outPutLabel.text = @"Shaking things up!";
        self.imageView.transform = CGAffineTransformIdentity;
        self.imageView.frame= _originalRect;
    }
}

- (IBAction)foundTap:(id)sender {
    self.outPutLabel.text = @"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
    self.outPutLabel.text = @"Swiped Right";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedBack;
    double scale;
    
    recognizer = (UIPinchGestureRecognizer *)sender;
    scale = recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    
    feedBack = [[NSString alloc]initWithFormat:@"Pinched, Scale:%1.2f, Velocity:%1.2f",recognizer.scale,recognizer.velocity];
    self.outPutLabel.text=feedBack;
    
    self.imageView.frame = CGRectMake(_originalRect.origin.x,
                                      _originalRect.origin.y,
                                      _originalRect.size.width*scale,
                                      _originalRect.size.height*scale);
}

- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedback;
    double rotation;
    
    recognizer = (UIRotationGestureRecognizer *)sender;
    rotation = recognizer.rotation;
    feedback = [[NSString alloc]initWithFormat:@"Rotated, Radians:%1.2f, Velocity:%1.2f",recognizer.rotation, recognizer.velocity];
    
    self.outPutLabel.text = feedback;
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

- (IBAction)SwipeLeft:(id)sender {
      self.outPutLabel.text = @"Swiped Left";
}
@end
