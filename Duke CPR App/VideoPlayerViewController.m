#import "VideoPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define DUKE_HEALTH_URL @"http://www.dukehealth.org/health_library/video/compression-only-cpr-saves-lives"


@interface VideoPlayerViewController ()
@property (nonatomic, strong) MPMoviePlayerController *myVideoPlayer;
@property (nonatomic, strong) UIView *myVideoView;
@end

@implementation VideoPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    if(!self.myVideoPlayer)
    {
        [self initializeVideoPlayer];
    }
    else
    {
        [self.myVideoPlayer prepareToPlay];
        [self.myVideoPlayer play];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackDidFinish) name:MPMoviePlayerPlaybackDidFinishNotification object:self.myVideoPlayer];

}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(!self.myVideoPlayer.fullscreen)
    {
        [self.myVideoPlayer pause];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.myVideoPlayer];
    }
}

- (void) initializeVideoPlayer
{
    self.myVideoView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.myVideoView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CPR Instruction Video" ofType:@"mov"];
    NSURL *videoURL = [NSURL fileURLWithPath:path];
    
    self.myVideoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    self.myVideoPlayer.controlStyle = MPMovieControlStyleEmbedded;
    self.myVideoPlayer.shouldAutoplay = YES;
    [self.myVideoPlayer.view setFrame: self.myVideoView.bounds];  // player's frame must match parent's
    [self.myVideoView addSubview: self.myVideoPlayer.view];
    [self.myVideoPlayer prepareToPlay];
    [self.myVideoPlayer play];
}

- (void) moviePlaybackDidFinish
{
    [self.myVideoPlayer setFullscreen:NO animated:NO];
    [self.myVideoPlayer pause];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.myVideoPlayer];
}

@end