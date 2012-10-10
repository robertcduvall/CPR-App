#import "AdditionalDataViewController.h"

#define DUKE_HEALTH_URL @"http://www.dukehealth.org/health_library/video/compression-only-cpr-saves-lives"


@interface AdditionalDataViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AdditionalDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [[NSURL alloc] initWithString:DUKE_HEALTH_URL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}


- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
