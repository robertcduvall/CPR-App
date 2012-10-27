

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImage *background = [UIImage imageNamed:@"duke_blue.png"];
    UIImage *background = [UIImage imageNamed:@"3d-blue-fractal_422_1417.jpg"];

    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
}


@end
