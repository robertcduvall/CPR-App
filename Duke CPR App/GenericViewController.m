//
//  GenericViewController.h
//  Duke CPR App
//
//  Created by Alexander Bruce on 9/29/12.
//  Copyright (c) 2012 Alexander Bruce. All rights reserved.
// Andrew was also here...

#import "GenericViewController.h"
#define NEXT_STEP_SEGUE @"NextStepSegue"
#define NUM_OF_FINGERS_ALLOWED_FOR_SWIPE 2


@interface GenericViewController ()

@end

@implementation GenericViewController

//Sets background and adds the gestureRecognizer
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *background = [UIImage imageNamed:@"2e_background_1136.jpg"];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
    [self addGestureRecognizer];

}
//adds gesturerecognizer for different number of fingers up to the number allowed we chose 1 or 2
-(void) addGestureRecognizer
{
    for(int i = 1; i  <= NUM_OF_FINGERS_ALLOWED_FOR_SWIPE; i++)
    {
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        swipeLeft.numberOfTouchesRequired = i;
        [self.view addGestureRecognizer:swipeLeft];
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        swipeRight.numberOfTouchesRequired = i;
        [self.view addGestureRecognizer:swipeRight];
    }
}
//method for doing something when a swipe occurs (it either advances to the next slide or returns to the previous
-(void) swipeRecognized: (UISwipeGestureRecognizer  *) recognizer
{
    //    if(recognizer.state != UIGestureRecognizerStateBegan) return;
    //    if(recognizer.state != UIGestureRecognizerStateRecognized) return;
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        @try
        {
            [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
        }
        @catch (NSException *exception)
        {
            //Silently die...muhaha
        }
    }
}

@end
