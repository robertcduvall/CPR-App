#import "CrisisStageSixViewController.h"
#define STAGE_SEVEN_TEXT @"Continue to the sound of the beat to save a life and keep going until help arrives"

@interface CrisisStageSixViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CrisisStageSixViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}

- (void)setUpTextView
{
    self.textView.text = STAGE_SEVEN_TEXT;
}

- (IBAction)doneButtonPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

@end
