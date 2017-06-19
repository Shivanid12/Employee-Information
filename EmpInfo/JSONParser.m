//
//  JSONParser.m
//  EmpInfo
//
//  Created by Shivani on 06/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+ (JSONParser *)sharedJSONParser {
    static JSONParser *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
        
    });
    
    return _sharedInstance;
}

-(NSMutableArray *)parser
{
    
    fileName = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"json"];
    
    
    if (fileName)
    {
        //retrieve file content
        NSString* jsonString = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        //convert JSON NSData to a usable NSDictionary
        NSError *error;
        dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        array = [dictionary copy];
        
        if (error)
        {
            NSLog(@"Something went wrong! %@", error.localizedDescription);
        }
        else
        {
        NSLog(@"json info: %@", dictionary);
        }
    }
    else
    {
        NSLog(@"Couldn't find file!");
    }
    
    return array;
    
}



@end

