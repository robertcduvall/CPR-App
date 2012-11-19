#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationItem setHidesBackButton:YES animated:NO];
}


- (void)viewDidUnload
{
    [self setLogo:nil];
    [super viewDidUnload];
}
@end
