//
//  NVViewController.m
//  36. UIPopover
//
//  Created by Admin on 19.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVViewController.h"
#import "NVTableViewController.h"
@interface NVViewController ()

@end

@implementation NVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datePicker.datePickerMode=UIDatePickerModeDate;
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    if (self.initialDate) {
        [self.datePicker setDate:[formatter dateFromString:self.initialDate]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)actionValueChanged:(UIDatePicker *)sender {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    if (self.vc) {
        self.vc.fieldDateOfBirth.text=[formatter stringFromDate:sender.date];
    }
}

- (IBAction)actionDone:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
