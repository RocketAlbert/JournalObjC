//
//  EntryTableViewController.m
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import "EntryTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryTableViewController ()

@end

@implementation EntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear: true];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [[[EntryController sharedInstance] entries] objectAtIndex:indexPath.row];
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = entry.bodyText;
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry* entry = [[[EntryController sharedInstance] entries] objectAtIndex:indexPath.row];
        [[EntryController sharedInstance] removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toEntryDetailVC"]){
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        EntryDetailViewController *destinationVC = [segue destinationViewController];
        Entry *entry = [[[EntryController sharedInstance] entries] objectAtIndex:indexPath.row];
        destinationVC.entryLandingPad = entry;
    }
}


@end
