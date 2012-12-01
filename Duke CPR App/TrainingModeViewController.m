#import "TrainingModeViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@interface TrainingModeViewController ()
@property (nonatomic, strong) UIView *myVideoView;
@property (nonatomic, strong) MPMoviePlayerController *myVideoPlayer;
@end

@implementation TrainingModeViewController

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
    //Exiting fullscreen or returning to View Controller
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
    CGRect frame = CGRectMake(0, 70, self.view.frame.size.width, 200);
    if(!self.myVideoView)
    {
        self.myVideoView = [[UIView alloc] initWithFrame:frame];
        [self.view addSubview:self.myVideoView];
    }
    
    NSString *class = NSStringFromClass([self class]);
    NSRange range = [class rangeOfString:@"ViewController"];
    class = [class substringToIndex:range.location];
    class = [NSString stringWithFormat:@"%@Video",class];
    NSString *path = [[NSBundle mainBundle] pathForResource:class ofType:@"mov"];
    if(path && path.length > 0)
    {
        NSURL *videoURL = [NSURL fileURLWithPath:path];
        
        self.myVideoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
        self.myVideoPlayer.controlStyle = MPMovieControlStyleEmbedded;
        self.myVideoPlayer.shouldAutoplay = YES;
        [self.myVideoPlayer.view setFrame: self.myVideoView.bounds];  // player's frame must match parent's
        [self.myVideoView addSubview: self.myVideoPlayer.view];

        //Play video
        [self.myVideoPlayer prepareToPlay];
        [self.myVideoPlayer play];
    }
}

- (void) moviePlaybackDidFinish
{
    [self.myVideoPlayer setFullscreen:NO animated:YES];
    self.myVideoPlayer.currentPlaybackTime = 0;
    [self.myVideoPlayer pause];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.myVideoPlayer];
}




@end
