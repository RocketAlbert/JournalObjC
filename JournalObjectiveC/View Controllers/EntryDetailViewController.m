//
//  EntryDetailViewController.m
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textViewText;
@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) updateViews {
    if (_entryLandingPad) {
        _textField.text = _entryLandingPad.title;
        _textViewText.text = _entryLandingPad.bodyText;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if(_entryLandingPad) {
        [[EntryController sharedInstance] updateEntry:_entryLandingPad withTitle:_textField.text withBodyText:_textViewText.text];
        [self.navigationController popViewControllerAnimated:true];
    } else {
        [[EntryController sharedInstance] addEntry:_textField.text withBodyText:_textViewText.text];
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (IBAction)clearButtonTapped:(id)sender {
    _textField.text = @"";
    _textViewText.text = @"";
}

@end
