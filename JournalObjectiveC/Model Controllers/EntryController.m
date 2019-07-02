//
//  EntryController.m
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"


@implementation EntryController

+ (instancetype)sharedInstance {
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
    });
    return shared;
}

-(void) addEntry:(NSString *)title withBodyText:(NSString *)bodyText {
    Entry* entry = [[Entry alloc] initWithName:title bodyText: bodyText];
    [self.entries addObject: entry];
     [self saveToPersistentStorage];
}

-(void) removeEntry:(Entry *)entry {
    [self.entries removeObject: entry];
     [self saveToPersistentStorage];
}

- (void)updateEntry:(Entry *)entry withTitle:(NSString *)title withBodyText:(NSString *)bodyText{
    entry.title = title;
    entry.bodyText = bodyText;
     [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry new] initWithDictionary:dictionary];
        [self addEntry:entry.title withBodyText:entry.bodyText];
    }
}

@end
