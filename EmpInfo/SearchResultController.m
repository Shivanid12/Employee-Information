//
//  SearchResultController.m
//  EmpInfo
//
//  Created by Shivani on 06/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import "SearchResultController.h"
#import "JSONParser.h"
@interface SearchResultController ()
@property NSArray *originalDataArray ;
@property NSArray *filteredDataArray ;

@end

@implementation SearchResultController

-(id)init
{
    self=[super init];
    if (self) {
        _originalDataArray=[[JSONParser sharedJSONParser] parser];
    }
    return  self;
}
-(void)loadView
{
    self.tableView=[[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds  style:UITableViewStylePlain];
    self.view=self.tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filteredDataArray count];
}

-(void)clearCellData:(UITableViewCell *)cell
{
    UIView *tempView=nil;
    tempView = [cell.contentView viewWithTag:101];//textLabel
    [tempView removeFromSuperview];
    tempView = [cell.contentView viewWithTag:201];//textLabel
    [tempView removeFromSuperview];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    [self clearCellData:cell];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    cell.textLabel.tag=101;
    cell.detailTextLabel.tag=201;
    cell.textLabel.text=[[self.filteredDataArray objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.text=[[self.filteredDataArray objectAtIndex:indexPath.row] valueForKey:@"employee ID"];
    cell.textLabel.font = [cell.textLabel.font fontWithSize:20];
    cell.textLabel.textColor=[UIColor purpleColor];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
}
/*
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    UISearchBar *searchBar=searchController.searchBar;
    NSString *target=searchBar.text;
   
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name contains[c] %@)",target];
    
    self.filteredDataArray=[self.originalDataArray filteredArrayUsingPredicate:predicate];
    NSLog(@"filtered array: %@",self.filteredDataArray);
    [self.tableView reloadData];
}

*/
@end
