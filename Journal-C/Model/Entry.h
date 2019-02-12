//
//  Entry.h
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bodyText;
@property (nonatomic, strong) NSDate *timestamp;

- (instancetype) initWithTitle:(NSString *)title
                    bodyText:(NSString *)bodyText
                   timestamp:(NSDate *)timestamp;

- (instancetype) initWithDictionaryCopy:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryCopy;

@end

//NS_ASSUME_NONNULL_END
