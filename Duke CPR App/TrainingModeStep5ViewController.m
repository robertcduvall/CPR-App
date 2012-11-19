

#import "TrainingModeStep5ViewController.h"

@interface TrainingModeStep5ViewController ()

@end

@implementation TrainingModeStep5ViewController



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
