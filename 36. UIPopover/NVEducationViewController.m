//
//  NVEducationViewController.m
//  36. UIPopover
//
//  Created by Admin on 19.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVEducationViewController.h"
#import "NVTableViewController.h"
@interface NVEducationViewController ()

@end

@implementation NVEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.arrayOfEducation=[[NSMutableArray alloc]initWithObjects:@"Low",@"Middle",@"High", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayOfEducation count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier=@"educationCell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell) {
        cell.textLabel.text=[self.arrayOfEducation objectAtIndex:indexPath.row];
    }
    if (self.initialEducation && [self.arrayOfEducation indexOfObject:self.initialEducation]==indexPath.row) {
        self.initialEducation=nil;
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        self.selectedCell=cell;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell* cell=[tableView cellForRowAtIndexPath:indexPath];
    if (self.selectedCell) {
        self.selectedCell.accessoryType=UITableViewCellAccessoryNone;
    }
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    self.selectedCell=cell;
    self.delegate.fieldEducation.text=[self.arrayOfEducation objectAtIndex:indexPath.row];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}
#pragma mark - UITableViewDelegate
#pragma mark - actions
- (IBAction)actionDone:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
