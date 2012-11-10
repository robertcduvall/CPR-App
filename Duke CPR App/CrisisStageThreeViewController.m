#import "CrisisStageThreeViewController.h"
#define STAGE_THREE_TEXT @"Place the victim on their back on a hard surface (neck stability)"
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageThreeViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CrisisStageThreeViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

- (void)setUpTextView
{
    self.textView.text = STAGE_THREE_TEXT;
}

@end
