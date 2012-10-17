#import "CrisisStageOneViewController.h"

#define STAGE_ONE_TEXT @"Check to see if the victim is unresponsive by shaking and shouting (gasping for breath does not mean the victim is okay)"
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisStageOneViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation CrisisStageOneViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextView];
    [self addGestureRecognizer];
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

- (NSString *) description
{
    NSString *description = [NSString stringWithFormat:@"CrisisViewOneController + %@",self.textView];
    return description;
}
@end
