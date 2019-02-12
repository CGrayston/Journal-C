//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

@class Entry;
NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

// Landing Pad that will be passed on segue from TableVC
@property (strong, nonatomic) Entry *entry;

-(void)updateViews;


@end

NS_ASSUME_NONNULL_END
