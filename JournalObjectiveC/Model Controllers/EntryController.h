//
//  EntryController.h
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, strong) NSMutableArray* entries;

//-(NSArray*)createAllEntries;
-(void)addEntry: (NSString *) title withBodyText:(NSString *)bodyText;
-(void)removeEntry: (Entry *) entry;
-(void)updateEntry: (Entry *) entry withTitle: (NSString *) title withBodyText: (NSString *) bodyText;
-(void)saveToPersistentStorage;
-(void)loadFromPersistentStorage;
@end

NS_ASSUME_NONNULL_END
