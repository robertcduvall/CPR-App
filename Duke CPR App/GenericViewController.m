

#import "GenericViewController.h"
#define NEXT_STEP_SEGUE @"NextStepSegue"
#define NUM_OF_FINGERS_ALLOWED_FOR_SWIPE 2


@interface GenericViewController ()

@end

@implementation GenericViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *background = [UIImage imageNamed:@"2e_background_1136.jpg"];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
    [self addGestureRecognizer];
}

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
