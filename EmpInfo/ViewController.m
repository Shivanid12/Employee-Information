//
//  ViewController.m
//  EmpInfo
//
//  Created by Shivani on 06/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *ageStr=[NSString stringWithFormat:@"%@",[self.dataDictionary valueForKey:@"age"]];
    
    self.NameLabel.text=[self.dataDictionary valueForKey:@"name"];
    self.positionLabel.text=[self.dataDictionary valueForKey:@"position"];
    self.profileLabel.text=[self.dataDictionary valueForKey:@"profile"];
    self.genderLabel.text=[self.dataDictionary valueForKey:@"Gender"];
    self.emailLabel.text=[self.dataDictionary valueForKey:@"email iD"];
    self.ageLabel.text=ageStr;
    self.contactLabel.text=[self.dataDictionary valueForKey:@"contact Info"];
    self.EIDLabel.text=[self.dataDictionary valueForKey:@"employee ID"];
    self.bloodGroupLabel.text=[self.dataDictionary valueForKey:@"blood group"];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
