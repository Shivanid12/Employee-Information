//
//  JSONParser.h
//  EmpInfo
//
//  Created by Shivani on 06/03/17.
//  Copyright © 2017 Shivani. All rights reserved.
//

#import<Foundation/Foundation.h>

@interface JSONParser : NSObject

{
    NSString *fileName ;
    NSMutableArray *array ;
    NSData *data;
    NSDictionary *dictionary ;
}
+ (JSONParser *)sharedJSONParser ;
-(NSMutableArray *)parser;


@end
