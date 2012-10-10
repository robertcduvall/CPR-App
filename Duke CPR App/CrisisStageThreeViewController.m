

#import "CrisisStageThreeViewController.h"
#define STAGE_THREE_TEXT @"Place the victim on their back on a hard surface (neck stability)"

@interface CrisisStageThreeViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CrisisStageThreeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
    [self addGestureRecognizer];
    
	
}

- (void)setUpTextView
{
    self.textView.text = STAGE_THREE_TEXT;
    
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
        [self performSegueWithIdentifier:@"Step3Segue" sender:self];
    }
}

-(void) backSwipeRecognized
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
