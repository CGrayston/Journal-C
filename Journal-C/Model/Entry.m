//
//  Entry.m
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
                    timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [NSDate date];
    }
    return self;
}

- (instancetype)initWithDictionaryCopy:(NSDictionary *)dictionary
{
    
    NSString *title = dictionary[@"title"];
    NSString *bodyText = dictionary[@"bodyText"];
    NSDate *timestamp = dictionary[@"timestamp"];
    return [self initWithTitle:title bodyText:bodyText timestamp:timestamp];
}

- (NSDictionary *)dictionaryCopy
{
    return @{
             @"title": self.title,
             @"bodyText": self.bodyText,
             @"timestamp": self.timestamp
             };
}
@end
