/*
 * Andrew Patterson
 */

#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *crisisModeButton;

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
}



- (void)viewDidUnload
{
    [self setCrisisModeButton:nil];
    [super viewDidUnload];
}
@end
