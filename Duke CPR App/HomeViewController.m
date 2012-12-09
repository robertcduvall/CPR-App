//
//  HomeViewController.h
//  Duke CPR App
//
//  Created by Alexander Bruce on 9/29/12.
//  Copyright (c) 2012 Alexander Bruce. All rights reserved.
// Andrew was also here...

#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *background = [UIImage imageNamed:@"2e_background_1136.jpg"];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
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
