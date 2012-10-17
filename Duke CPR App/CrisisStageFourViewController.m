#import "CrisisStageFourViewController.h"
#define STAGE_FOUR_TEXT @"Place your hands in the center of their chest and lock your elbows"
#define AUTO_PROGRESS_TIMER_INTERVAL 2
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageFourViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) NSTimer *autoprogressTimer;
@end

@implementation CrisisStageFourViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.autoprogressTimer = [NSTimer scheduledTimerWithTimeInterval:AUTO_PROGRESS_TIMER_INTERVAL target:self selector:@selector(autoprogress) userInfo:nil repeats:NO];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.autoprogressTimer invalidate];
    [super viewWillDisappear:YES];
}

- (void) autoprogress
{
    [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
}

- (void)setUpTextView
{
    self.textView.text = STAGE_FOUR_TEXT;
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

@end
