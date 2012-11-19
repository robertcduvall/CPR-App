
#import "TrainingModeStep2ViewController.h"

@interface TrainingModeStep2ViewController ()

@end

@implementation TrainingModeStep2ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)doneButtonPressed:(id)sender {
    UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:vc animated:YES];
}


@end
