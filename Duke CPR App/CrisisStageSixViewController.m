#import "CrisisStageSixViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define STAGE_SEVEN_TEXT @"Continue to the sound of the beat to save a life and keep going until help arrives"

@interface CrisisStageSixViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *myVideoView;
@property (nonatomic, strong) MPMoviePlayerController *myVideoPlayer;

@end

@implementation CrisisStageSixViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTextView];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self initializeVideoPlayer];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.myVideoPlayer stop];
}


- (void) initializeVideoPlayer
{
    CGRect frame = CGRectMake(0, 110, self.view.frame.size.width, 200);
    self.myVideoView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:self.myVideoView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Ken-Jeong-Video" ofType:@"mov"];
    NSURL *videoURL = [NSURL fileURLWithPath:path];
    
    self.myVideoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    self.myVideoPlayer.controlStyle = MPMovieControlStyleNone;
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFinishedPlaying) name:MPMoviePlayerPlaybackDidFinishNotification object:self.myVideoPlayer];
    self.myVideoPlayer.shouldAutoplay = YES;
    [self.myVideoPlayer.view setFrame: self.myVideoView.bounds];  // player's frame must match parent's
    [self.myVideoView addSubview: self.myVideoPlayer.view];
    
    //Play video
    [self.myVideoPlayer prepareToPlay];
    [self.myVideoPlayer play];
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
