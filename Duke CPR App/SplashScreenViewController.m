#import "SplashScreenViewController.h"

#define SHOW_HOME_SEGUE @"showHomeSegue"
#define STATUS_BAR_HEIGHT 20
#define FOUR_INCH_SCREEN_HEIGHT 568
#define SPLASH_SCREEN_DISPLAY_TIME 1.8

@interface SplashScreenViewController ()
@end

@implementation SplashScreenViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) doneShowingSplashScreen
{
    [self performSegueWithIdentifier:SHOW_HOME_SEGUE sender:self];
}
// loads appropriate images based on the device being used
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    NSMutableString *path = [[NSMutableString alloc]init];
    [path setString:[[NSBundle mainBundle] resourcePath]];
    //If 4 inch screen
    if([[UIScreen mainScreen] applicationFrame].size.height + STATUS_BAR_HEIGHT >= FOUR_INCH_SCREEN_HEIGHT)
    {
        [path setString:[path stringByAppendingPathComponent:@"Default-568h@2x.png"]];
    }
    //If 3.5 inch screen
    else
    {
        //If retina
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2.0)
        {
            [path setString:[path stringByAppendingPathComponent:@"Default@2x.png"]];
        }
        //If not retina
        else
        {
            [path setString:[path stringByAppendingPathComponent:@"Default.png"]];
        }
    }
    UIImage *splashImage = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:splashImage];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if([[UIScreen mainScreen] applicationFrame].size.height + STATUS_BAR_HEIGHT >= FOUR_INCH_SCREEN_HEIGHT)
    {
        [self performSegueWithIdentifier:SHOW_HOME_SEGUE sender:self];
    }
    else
    {
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    [self.view addSubview:imageView];
    [NSTimer scheduledTimerWithTimeInterval:SPLASH_SCREEN_DISPLAY_TIME target:self selector:@selector(doneShowingSplashScreen) userInfo:nil repeats:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
@end
