//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Chris Grayston on 2/11/19.
//  Copyright © 2019 Chris Grayston. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "Entry.h"

@interface EntryDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (self.entry) {
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.bodyText;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if ([self.titleTextField.text isEqualToString:@""] || [self.bodyTextView.text isEqualToString:@""]) {
        if ([self.titleTextField.text isEqualToString:@""]) {
            self.titleTextField.text = @"Please fill this out before saving";
        }
        if ([self.bodyTextView.text isEqualToString:@""]) {
            self.bodyTextView.text = @"Please fill this out before saving";
        }
        return;
    }
    if (self.entry) {
        [[EntryController shared] modifyEntry:self.entry withTitle:self.titleTextField.text body:self.bodyTextView.text];
        
    } else {
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text timestamp:[NSDate date]];
        [[EntryController shared] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearTextButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

@end
