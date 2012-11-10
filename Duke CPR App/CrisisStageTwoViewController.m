
#import "CrisisStageTwoViewController.h"

#define STAGE_TWO_TEXT @"Call 911 and ask for an AED"
#define NEXT_STEP_SEGUE @"NextStepSegue"
#define EMERGENCY_NUMBER_STRING @"tel:911"

@interface CrisisStageTwoViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *dialButton;
- (IBAction)dial911:(id)sender;
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
    self.dialButton.backgroundColor = [UIColor redColor];
    [self.dialButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.dialButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    self.dialButton.layer.cornerRadius = 10;
    self.dialButton.layer.borderWidth = 1;
    self.dialButton.layer.borderColor = [UIColor blackColor].CGColor;
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:EMERGENCY_NUMBER_STRING]])
    {
        self.dialButton.hidden = NO;
    }
    else
    {
        //self.dialButton.hidden = YES;
    }
    
}


- (void)setUpTextView
{
    self.textView.text = STAGE_TWO_TEXT;
}


- (void)viewDidUnload
{
    [self setTextView:nil];
    [self setDialButton:nil];
    [super viewDidUnload];
}

- (IBAction)dial911:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:EMERGENCY_NUMBER_STRING]];
}
@end
