#import "CrisisStageFourViewController.h"
#define STAGE_FOUR_TEXT @"Place your hands in the center of their chest and lock your elbows"
#define AUTO_PROGRESS_TIMER_INTERVAL 2
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageFourViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) NSTimer *autoprogressTimer;
@end

@implementation CrisisStageFourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
    [self addGestureRecognizer];
}

- (void) viewDidAppear:(BOOL)animated
{
    self.autoprogressTimer = [NSTimer scheduledTimerWithTimeInterval:AUTO_PROGRESS_TIMER_INTERVAL target:self selector:@selector(autoprogress) userInfo:nil repeats:NO];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.autoprogressTimer invalidate];
}

- (void) autoprogress
{
    [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
}

- (void)setUpTextView
{
    self.textView.text = STAGE_FOUR_TEXT;
}


- (void)viewDidUnload {
    [self setTextView:nil];
    [super viewDidUnload];
}

-(void) addGestureRecognizer
{
    UIPanGestureRecognizer *pan;
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
    [pan setMinimumNumberOfTouches:1];
    [self.view addGestureRecognizer:pan];
}


-(void) swipeRecognized: (UIPanGestureRecognizer  *) recognizer
{
    if(recognizer.state != UIGestureRecognizerStateBegan) return;
    CGPoint velocity = [recognizer velocityInView:self.view];
    if(velocity.x > 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
    }
}

-(void) backSwipeRecognized
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
