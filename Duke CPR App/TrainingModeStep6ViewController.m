
#import "TrainingModeStep6ViewController.h"

@interface TrainingModeStep6ViewController ()

@end

@implementation TrainingModeStep6ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)doneButtonPressed:(id)sender {
    UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:vc animated:YES];
}





@end
