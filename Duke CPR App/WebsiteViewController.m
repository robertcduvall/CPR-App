
#import "WebsiteViewController.h"

@interface WebsiteViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebsiteViewController

//opens the url of the website which is set in the prep for segue of the additonal data view controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.websiteURL];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
}


- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
