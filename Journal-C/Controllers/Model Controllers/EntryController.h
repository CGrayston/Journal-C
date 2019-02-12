//
//  EntryController.h
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

// Shared instance
+ (EntryController *)shared;

// Source of Truth
@property (nonatomic, strong) NSMutableArray<Entry*> *entries;

// MARK: - Methods
- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;
- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)modifyEntry:(Entry *)entry withTitle:(NSString *)title body:(NSString *)body;

@end

NS_ASSUME_NONNULL_END
