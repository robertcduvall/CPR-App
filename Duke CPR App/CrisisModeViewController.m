#import "CrisisModeViewController.h"
#import <AVFoundation/AVFoundation.h>
#define NEXT_STEP_SEGUE @"NextStepSegue"

@interface CrisisModeViewController ()

@end

@implementation CrisisModeViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAudioPlayer];
    [self addGestureRecognizer];
}

- (void) viewDidAppear:(BOOL)animated
{
    self.audioPlayer.currentTime = 0.0f;
    [self.audioPlayer play];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.audioPlayer stop];
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
        @try
        {
            [self performSegueWithIdentifier:NEXT_STEP_SEGUE sender:self];
        }
        @catch (NSException *exception)
        {
            //Silently die...muhaha
        }
    }
}

- (void) initializeAudioPlayer
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Voices" ofType:@"mp3"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.audioPlayer.delegate = self;
    [self.audioPlayer prepareToPlay];
}



@end
