//
//  ViewController.m
//  36. UIPopover
//
//  Created by Admin on 19.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVTableViewController.h"
#import "NVViewController.h"
#import "NVEducationViewController.h"
@interface NVTableViewController ()

@end

@implementation NVTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueInfo"]) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    } else if ([segue.identifier isEqualToString:@"segueDate"]) {
        NVViewController* vc=(NVViewController*)[[segue.destinationViewController viewControllers] lastObject];
        
        vc.vc=self;
        if ([self.fieldDateOfBirth.text length]>0) {
            vc.initialDate=self.fieldDateOfBirth.text;
        }
        
    } else if ([segue.identifier isEqualToString:@"segueEducation"]) {
        NVEducationViewController* vc=(NVEducationViewController*)[[segue.destinationViewController viewControllers] lastObject];
        
        vc.delegate=self;
        if ([self.fieldEducation.text length]>0) {
            vc.initialEducation=self.fieldEducation.text;
        }
        
    }
    
}

#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    BOOL shouldBegin=YES;
    if ([textField isEqual:self.fieldDateOfBirth]) {
        [self performSegueWithIdentifier:@"segueDate" sender:self];
        shouldBegin=NO;
    } else if ([textField isEqual:self.fieldEducation]){
        [self performSegueWithIdentifier:@"segueEducation" sender:self];
        shouldBegin=NO;
    }
        
    return shouldBegin;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
