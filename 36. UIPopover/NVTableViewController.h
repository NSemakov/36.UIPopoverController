//
//  ViewController.h
//  36. UIPopover
//
//  Created by Admin on 19.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fieldFirstname;
@property (weak, nonatomic) IBOutlet UITextField *fieldLastname;
@property (weak, nonatomic) IBOutlet UITextField *fieldDateOfBirth;
@property (weak, nonatomic) IBOutlet UITextField *fieldEducation;

@end

