
#import "CrisisStageTwoViewController.h"

#define STAGE_TWO_TEXT @"Call 911 and ask for an AED"
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageTwoViewController ()<UIGestureRecognizerDelegate>
- (IBAction)dial911:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation CrisisStageTwoViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        //Nothing needs to happen
        //might in the future want to set up some stuff
}

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}


- (void)setUpTextView
{
    self.textView.text = STAGE_TWO_TEXT;
}


- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

- (IBAction)dial911:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:911"]];
}
@end
