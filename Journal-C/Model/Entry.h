//
//  Entry.h
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *bodyText;
@property (nonatomic, readonly) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title
                    bodyText:(NSString *)bodyText
                   timestamp:(NSDate *)timestamp;


@end

NS_ASSUME_NONNULL_END
