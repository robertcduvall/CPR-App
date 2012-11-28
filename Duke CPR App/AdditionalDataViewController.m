#import "AdditionalDataViewController.h"
#import "WebsiteViewController.h"
#import <QuartzCore/QuartzCore.h>


#define CELL @"prototypeCell"
#define ROWS self.rowTitles.count
#define VIDEO_ROW_TITLE @"Duke CPR Video"

@interface AdditionalDataViewController () <UITableViewDataSource,UITableViewDelegate   >
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *rowToWebUrls;
@property (strong, nonatomic) NSNumber *row;
@property (strong, nonatomic) NSMutableArray *rowTitles;

@end

@implementation AdditionalDataViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    [self mapInit];
    [self arrayInit];
}

-(void) arrayInit
{
    self.rowTitles = [[NSMutableArray alloc] init];
    [self.rowTitles addObject:@"Duke Health"];
    [self.rowTitles addObject:@"American Heart Association"];
    [self.rowTitles addObject:@"Heart Rescue Project"];
    [self.rowTitles addObject:@"Patients Like Me"];
    [self.rowTitles addObject:@"WomenHeart"];
    [self.rowTitles addObject:VIDEO_ROW_TITLE];
}

- (void) mapInit
{
    self.rowToWebUrls = [[NSMutableDictionary alloc] init];
    [self.rowToWebUrls setObject:@"http://www.dukehealth.org/heart_center" forKey:[NSNumber numberWithInt:0]];
    [self.rowToWebUrls setObject:@"http://www.heart.org/HEARTORG/CPRAndECC/CPR_UCM_001118_SubHomePage.jsp" forKey:[NSNumber numberWithInt:1]];
    [self.rowToWebUrls setObject:@"http://www.heartrescueproject.com/heartrescue-program/heart-rescue-project-partners/partners/AMRMedicine/index.htm" forKey:[NSNumber numberWithInt:2]];
    [self.rowToWebUrls setObject:@"http://www.patientslikeme.com/" forKey:[NSNumber numberWithInt:3]];
    [self.rowToWebUrls setObject:@"http://www.womenheart.org/" forKey:[NSNumber numberWithInt:4]];
}


- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CELL];
    cell.textLabel.text = [self.rowTitles objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.row = [NSNumber numberWithInt:indexPath.row];
    
    NSString *rowTitle = [self.rowTitles objectAtIndex:indexPath.row];
    if([rowTitle isEqualToString:VIDEO_ROW_TITLE])
    {
        [self performSegueWithIdentifier:@"video segue" sender:self];   
    }
    else [self performSegueWithIdentifier:@"info page segue" sender:self];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[WebsiteViewController class]])
    {
        WebsiteViewController * dest = (WebsiteViewController *) segue.destinationViewController;
        dest.websiteURL = [self.rowToWebUrls objectForKey:self.row];
     }
    UIViewController *dest = segue.destinationViewController;
    dest.title = [self.rowTitles objectAtIndex:[self.row intValue]];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}
@end
