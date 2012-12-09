#import "AdditionalDataViewController.h"
#import "WebsiteViewController.h"
#import <QuartzCore/QuartzCore.h>


#define CELL @"prototypeCell"
#define ROWS self.rowTitles.count


//Row titles
#define DUKE_HEART_CENTER_ROW_TITLE @"Duke Heart Center"
#define AHA_ROW_TITLE @"American Heart Association"
#define HEARTRESCUE_ROW_TITLE @"HeartRescue Project"
#define PATIENTS_LIKE_ME_ROW_TITLE @"Patients Like Me"
#define WOMENHEART_ROW_TITLE @"WomenHeart"
#define GOOD_SAMARITAN_ROW_TITLE @"Good Samaritan Law"
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
    
    [self tableDataInit];
    [self mapInit];
}
//creates the rows with specified titles
- (void) tableDataInit
{
    self.rowTitles = [[NSMutableArray alloc] init];
    [self.rowTitles addObject:DUKE_HEART_CENTER_ROW_TITLE];
    [self.rowTitles addObject:AHA_ROW_TITLE];
    [self.rowTitles addObject:HEARTRESCUE_ROW_TITLE];
    [self.rowTitles addObject:PATIENTS_LIKE_ME_ROW_TITLE];
    [self.rowTitles addObject:WOMENHEART_ROW_TITLE];
    [self.rowTitles addObject:GOOD_SAMARITAN_ROW_TITLE];
    [self.rowTitles addObject:VIDEO_ROW_TITLE];
    self.rowTitles = [[self.rowTitles sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] mutableCopy];
}
//maps the urls to the specific rows
- (void) mapInit
{
    self.rowToWebUrls = [[NSMutableDictionary alloc] init];
    [self.rowToWebUrls setObject:@"http://www.dukehealth.org/heart_center" forKey:DUKE_HEART_CENTER_ROW_TITLE];
    [self.rowToWebUrls setObject:@"http://www.heart.org/HEARTORG/CPRAndECC/CPR_UCM_001118_SubHomePage.jsp" forKey:AHA_ROW_TITLE];
    [self.rowToWebUrls setObject:@"http://www.heartrescueproject.com/heartrescue-program/heart-rescue-project-partners/partners/AMRMedicine/index.htm" forKey:HEARTRESCUE_ROW_TITLE];
    [self.rowToWebUrls setObject:@"http://www.patientslikeme.com/" forKey:PATIENTS_LIKE_ME_ROW_TITLE];
    [self.rowToWebUrls setObject:@"http://www.womenheart.org/" forKey:WOMENHEART_ROW_TITLE];
    [self.rowToWebUrls setObject:@"http://www.heartsafeam.com/pages/faq_good_samaritan" forKey:GOOD_SAMARITAN_ROW_TITLE];
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
// preps to open a website view controller with the url from the map
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[WebsiteViewController class]])
    {
        WebsiteViewController * dest = (WebsiteViewController *) segue.destinationViewController;
        dest.websiteURL = [self.rowToWebUrls objectForKey:[self.rowTitles objectAtIndex: [self.row integerValue]]];
     }
    UIViewController *dest = segue.destinationViewController;
    dest.title = [self.rowTitles objectAtIndex:[self.row intValue]];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}
@end
