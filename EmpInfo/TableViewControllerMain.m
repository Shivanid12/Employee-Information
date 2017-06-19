//
//  TableViewControllerMain.m
//  EmpInfo
//
//  Created by Shivani on 06/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import "TableViewControllerMain.h"
#import "JSONParser.h"
#import "ViewController.h"
@interface TableViewControllerMain ()

@property NSArray *dataSourceArray ;
@property NSArray *filteredArray;
@property UITextField  *searchTable ;
@property BOOL flag ;
@property BOOL insertRowFlag ;

@end

@implementation TableViewControllerMain
-(id)init
{
    self=[super init];
    if(self)
    {
        _dataSourceArray=[[JSONParser sharedJSONParser] parser];
        _flag=0;
        _insertRowFlag=0;
      //  NSLog(@"data source Array: %@",self.dataSourceArray);
        
    }
    return self;
    
}

-(void)loadView
{
      self.tableView=[[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds  style:UITableViewStylePlain];
    self.view=self.tableView;
    
       self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"plus-2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(insertRowButtonPressed:)];
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;

}

-(IBAction)insertRowButtonPressed:(id)sender
{
    self.insertRowFlag=1;
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
   /* UISearchBar *bar=[UISearchBar new];
    [bar sizeToFit];
    self.tableView.tableHeaderView=bar;*/
    self.searchTable = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,40) ];
    self.tableView.tableHeaderView=self.searchTable;
    self.searchTable.placeholder=@"search";
    self.searchTable.delegate=self;
     self.tableView.rowHeight=130;
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.flag=0;
    [self.tableView reloadData];
   
    
    
}

-(NSArray *)returnVisibleArray
{
    if(self.flag==0)
        return self.dataSourceArray;
    else
        return self.filteredArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self returnVisibleArray] count ];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier=@"cell";
    TableViewCell1 *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if(cell == nil)
    {
        cell =[[TableViewCell1 alloc] init];
        [cell createSubViews];
    }
        [cell updateValues:[[self returnVisibleArray] objectAtIndex:indexPath.row]];

    return cell;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTable resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
}
- (void)textFieldDidChange:(NSNotification *)notification
{
    if([self.searchTable.text isEqual:@""])
    {
        self.flag=0;
        [self.tableView reloadData];
       
    }
    else
    {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name contains[c] %@)",self.searchTable.text];
    self.flag=1;
    self.filteredArray=[self.dataSourceArray filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];
    }
    
    // Do whatever you like to respond to text changes here.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *viewController=[[ViewController alloc] initWithNibName:nil bundle:nil];
    viewController.dataDictionary=[[self returnVisibleArray] objectAtIndex:indexPath.row];
    NSLog(@"dictionary: %@",viewController.dataDictionary);
   // [self.parentViewController showViewController:viewController sender:self];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.flag=0;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.insertRowFlag==1)
        return UITableViewCellEditingStyleInsert;
    
      return  UITableViewCellEditingStyleNone;
}

@end
