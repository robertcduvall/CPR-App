#import "CrisisModeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CrisisModeViewController ()

@end

@implementation CrisisModeViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeAudioPlayer];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textViewTapped)];
    [self.textView addGestureRecognizer:tap];
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



- (void) textViewTapped
{
    if(![self.audioPlayer isPlaying])
    {
        self.audioPlayer.currentTime = 0.0f;
        [self.audioPlayer play];
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
