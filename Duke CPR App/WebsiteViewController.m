
#import "WebsiteViewController.h"

@interface WebsiteViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebsiteViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.websiteURL];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
    NSLog(@"%@",self.websiteURL);
}


- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
