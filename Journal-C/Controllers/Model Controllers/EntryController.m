//
//  EntryController.m
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)shared {
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
        shared.entries = [NSMutableArray new];
        
        [shared loadFromPersistentStorage];
    });
    return shared;
}

- (void)addEntry:(Entry *)entry
{
    
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry
{
    // TODO
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)modifyEntry:(Entry *)entry withTitle:(NSString *)title body:(NSString *)body
{
    entry.title = title;
    entry.bodyText = body;
    [self saveToPersistentStorage];
}

// MARK: - CRUD
- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry new] initWithDictionaryCopy:dictionary];
        [self addEntry:entry];
    }
    
}
@end
