#import "AdditionalDataViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define DUKE_HEALTH_URL @"http://www.dukehealth.org/health_library/video/compression-only-cpr-saves-lives"


@interface AdditionalDataViewController ()
@property (nonatomic, strong) MPMoviePlayerController *myVideoPlayer;
@property (nonatomic, strong) UIView *myVideoView;
@end

@implementation AdditionalDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self initializeVideoPlayer];
}

- (void) initializeVideoPlayer
{
    self.myVideoView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.myVideoView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CPR Instruction Video" ofType:@"mov"];
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


- (void)viewDidUnload
{
    [super viewDidUnload];
}
@end
