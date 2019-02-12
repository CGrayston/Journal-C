//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[[EntryController shared] loadFromPersistentStorage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
    NSMutableArray<Entry*> *entriesTemp = EntryController.shared.entries;
    for (Entry *entry in entriesTemp) {
        //[entryDictionaries addObject:entry.dictionaryCopy];
        NSLog(@"Entry %@, %@", entry.title, entry.bodyText);
    }
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[EntryController shared] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [[EntryController shared] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}


// TODO
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = [[EntryController shared] entries][indexPath.row];
        [[EntryController shared] removeEntry:entry];
        [tableView reloadData];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toViewEntrySegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EntryDetailViewController *destinationVC = [segue destinationViewController];
        Entry *entry = [[EntryController shared] entries][indexPath.row];
        destinationVC.entry = entry;
    }

    
}


@end
