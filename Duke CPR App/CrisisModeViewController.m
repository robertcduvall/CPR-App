#import "CrisisModeViewController.h"
#import <AVFoundation/AVFoundation.h>
#define NEXT_STEP_SEGUE @"NextStepSegue"
#define NUM_OF_FINGERS_ALLOWED_FOR_SWIPE 2

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
    for(int i = 1; i  <= NUM_OF_FINGERS_ALLOWED_FOR_SWIPE; i++)
    {
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        swipeLeft.numberOfTouchesRequired = i;
        [self.view addGestureRecognizer:swipeLeft];
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRecognized:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        swipeRight.numberOfTouchesRequired = i;
        [self.view addGestureRecognizer:swipeRight];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textViewTapped)];
    [self.textView addGestureRecognizer:tap];
}

- (void) textViewTapped
{
    if(![self.audioPlayer isPlaying])
    {
        self.audioPlayer.currentTime = 0.0f;
        [self.audioPlayer play];
    }
}

-(void) swipeRecognized: (UISwipeGestureRecognizer  *) recognizer
{
//    if(recognizer.state != UIGestureRecognizerStateBegan) return;
//    if(recognizer.state != UIGestureRecognizerStateRecognized) return;
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
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
    NSString *className = NSStringFromClass(self.class);
    NSString *audioFile = [className substringFromIndex:6];
    audioFile = [audioFile substringToIndex:[audioFile rangeOfString:@"ViewController"].location];
    audioFile = [NSString stringWithFormat:@"%@VoiceCommands",audioFile];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:audioFile ofType:@"mp3"];
    if(path && path.length > 0)
    {
        NSURL *url = [NSURL fileURLWithPath:path];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
    }

}



@end
