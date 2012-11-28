#import "SplashScreenViewController.h"

#define SHOW_HOME_SEGUE @"showHomeSegue"

@interface SplashScreenViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SplashScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSMutableString *path = [[NSMutableString alloc]init];
//    [path setString:[[NSBundle mainBundle] resourcePath]];
//    [path setString:[path stringByAppendingPathComponent:@"Default.png"]];
//    UIImage *background = [[UIImage alloc] initWithContentsOfFile:path];    UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
//    imageView.frame = self.view.frame;
//    NSLog(@"%@",background);
//    [self.view addSubview:imageView];
////    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
    
//    self.imageView.image = [UIImage imageNamed:<#(NSString *)#>];
//    self.imageView.transform = CGAffineTransformMakeTranslation(0, -20);
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(doneShowingSplashScreen) userInfo:nil repeats:NO];
}

- (void) doneShowingSplashScreen
{
    [self performSegueWithIdentifier:SHOW_HOME_SEGUE sender:self];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}
@end
