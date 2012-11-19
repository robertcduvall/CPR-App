
#import "TrainingModeStep1ViewController.h"

@interface TrainingModeStep1ViewController ()

@end

@implementation TrainingModeStep1ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)donePressed:(id)sender {
    UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:vc animated:YES];
}



@end
