#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *crisisModeButton;
@property (weak, nonatomic) IBOutlet UIImageView *logo;

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.crisisModeButton.backgroundColor = [UIColor redColor];
    [self.crisisModeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.crisisModeButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    self.crisisModeButton.layer.cornerRadius = 10;
    self.crisisModeButton.layer.borderWidth = 1;
    self.crisisModeButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.logo.layer.cornerRadius = 50;
    self.logo.clipsToBounds = YES;
}



- (void)viewDidUnload
{
    [self setCrisisModeButton:nil];
    [self setLogo:nil];
    [super viewDidUnload];
}
@end
