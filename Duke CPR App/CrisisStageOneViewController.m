#import "CrisisStageOneViewController.h"

#define STAGE_ONE_TEXT @"Check to see if the victim is unresponsive by shaking and shouting "

@interface CrisisStageOneViewController () <UIGestureRecognizerDelegate>
@end

@implementation CrisisStageOneViewController


#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextView];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

- (void) setupTextView
{
    self.textView.text = STAGE_ONE_TEXT;
}

- (NSString *) description
{
    NSString *description = [NSString stringWithFormat:@"CrisisViewOneController + %@",self.textView];
    return description;
}
@end
