
#import "CrisisStageFiveViewController.h"
#define STAGE_FIVE_TEXT @"Push hard and fast\n2 inches deep and 100 beats per minute"
#define AUTO_PROGRESS_TIMER_INTERVAL 7
#define AUTO_PROGRESS_DELAY 2
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageFiveViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) NSTimer *autoprogressTimer;
@end

@implementation CrisisStageFiveViewController


#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.autoprogressTimer = [NSTimer scheduledTimerWithTimeInterval:self.audioPlayer.duration + AUTO_PROGRESS_DELAY target:self selector:@selector(autoprogress) userInfo:nil repeats:NO];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.autoprogressTimer invalidate];
    [super viewWillDisappear:animated];
}

- (void) autoprogress
{
    [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
}


- (void)setUpTextView
{
    self.textView.text = STAGE_FIVE_TEXT;
}


- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}
@end
