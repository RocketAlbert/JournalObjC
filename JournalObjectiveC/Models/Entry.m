//
//  Entry.m
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)initWithName:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *bodyText = dictionary[@"bodyText"];

    return [self initWithName:title bodyText:bodyText ];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             @"title": self.title,
             @"bodyText": self.bodyText
             };
}



@end
