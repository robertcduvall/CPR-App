#import "CrisisModeViewController.h"
#import <AVFoundation/AVFoundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

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
    [self customizeTextView];
}

- (void) customizeTextView
{
    self.textView.font = [UIFont fontWithName:@"Arial-BoldMT" size:26];
    self.textView.textColor = UIColorFromRGB(0x001A57);
    self.textView.textAlignment = NSTextAlignmentLeft;
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
