//
//  ViewController.h
//  Gestures
//
//  Created by Daniel Reid on 3/18/13.
//  Copyright (c) 2013 TitanTV BIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outPutLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)foundTap:(id)sender;
- (IBAction)foundSwipe:(id)sender;
- (IBAction)foundPinch:(id)sender;
- (IBAction)foundRotation:(id)sender;
- (IBAction)SwipeLeft:(id)sender;

@end
