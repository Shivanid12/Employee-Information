//
//  TableViewCell1.m
//  EmpInfo
//
//  Created by Shivani on 07/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import "TableViewCell1.h"

@implementation TableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)createSubViews
{
    if (!self.nameLabel)
    {
        self.nameLabel=[UILabel new];
        self.nameLabel.frame=CGRectMake(self.contentView.frame.origin.x+85, self.contentView.frame.origin.y+10, 100, 30);
        [self.contentView addSubview:self.nameLabel];
        
    }
    if (!self.nameValue)
    {
        self.nameValue=[UILabel new];
        self.nameValue.frame=CGRectMake(self.contentView.frame.origin.x+205, self.contentView.frame.origin.y+10,100,30);
        [self.contentView addSubview:self.nameValue];
    }
    
    if (!self.emailLabel)
    {
        self.emailLabel=[UILabel new];
        self.emailLabel.frame=CGRectMake(self.contentView.frame.origin.x+85, self.contentView.frame.origin.y+40, 100, 30);
        [self.contentView addSubview:self.emailLabel];
    }
    if (!self.emailValue)
    {
        self.emailValue=[UILabel new];
        
        self.emailValue.frame=CGRectMake(self.contentView.frame.origin.x+205, self.contentView.frame.origin.y+40,150,30);
        [self.contentView addSubview:self.emailValue];
        
    }
    
    if (!self.contactLabel)
    {
        self.contactLabel=[UILabel new];
        self.contactLabel.frame=CGRectMake(self.contentView.frame.origin.x+85, self.contentView.frame.origin.y+70, 120, 30);
            [self.contentView addSubview:self.contactLabel];
        
    
}

    if (!self.contactValue)
    {
        self.contactValue=[UILabel new];

        self.contactValue.frame =CGRectMake(self.contentView.frame.origin.x+205, self.contentView.frame.origin.y+70,150,30);
        [self.contentView addSubview:self.contactValue];
    }
    
    if(!self.imageView1)
    {
        self.imageView1=[UIImageView new];
        self.imageView1.frame=CGRectMake(self.contentView.frame.origin.x+10, self.contentView.frame.origin.y+30, 60, 60);
        [self.contentView addSubview:self.imageView1];
            }
}


-(void)updateValues:(NSDictionary *)dictionary
{
    self.nameLabel.text=@"Name :";
    
    self.nameValue.text=[dictionary valueForKey:@"name"];

    self.emailLabel.text=@"Email :";
    
    self.emailValue.text=[dictionary valueForKey:@"email iD"];
    
    self.contactLabel.text=@"Contact Info :";

    self.contactValue.text=[dictionary valueForKey:@"contact Info"];
    
    self.imageView1.image=[UIImage imageNamed:@"unnamed.png"];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
