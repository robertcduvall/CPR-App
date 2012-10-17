

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *background = [UIImage imageNamed:@"duke_blue.png"];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
}


@end
