//
//  TableViewCell1.h
//  EmpInfo
//
//  Created by Shivani on 07/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell1 : UITableViewCell
@property UILabel *nameLabel ;
@property UILabel *nameValue ;
@property UILabel *emailLabel ;
@property UILabel *emailValue;
@property UILabel *contactLabel ;
@property UILabel *contactValue ;
@property UIImageView *imageView1 ;

- (void)createSubViews;
-(void)updateValues:(NSDictionary *)dictionary;

@end
