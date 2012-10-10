
#import "CrisisStageSixViewController.h"
#define STAGE_SIX_TEXT @"Push hard and fast (2 inches deep 100 beats per minute)"
@interface CrisisStageSixViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CrisisStageSixViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
    [self addGestureRecognizer];
    
    
	
}

- (void)setUpTextView
{
    self.textView.text = STAGE_SIX_TEXT;
    
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
        [self performSegueWithIdentifier:@"Step6Segue" sender:self];
    }
}

-(void) backSwipeRecognized
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
