#import "CrisisStageSixViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define STAGE_SIX_TEXT @"Continue to the sound of the beat to save a life and keep going until help arrives"

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
    [super viewDidAppear:YES];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)setUpTextView
{
    self.textView.text = STAGE_SIX_TEXT;
}

- (IBAction)doneButtonPressed:(id)sender
{
    UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

@end
