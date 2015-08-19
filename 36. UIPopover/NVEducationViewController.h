//
//  NVEducationViewController.h
//  36. UIPopover
//
//  Created by Admin on 19.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NVTableViewController;
@interface NVEducationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)actionDone:(UIBarButtonItem *)sender;
@property (strong,nonatomic) NVTableViewController* delegate;
@property (strong,nonatomic) NSMutableArray *arrayOfEducation;
@property (strong,nonatomic) UITableViewCell* selectedCell;
@property (strong,nonatomic) NSString* initialEducation;
@end
