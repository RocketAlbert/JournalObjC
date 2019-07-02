//
//  Entry.h
//  JournalObjectiveC
//
//  Created by Albert Yu on 7/1/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* bodyText;
// @property (nonatomic, copy) NSDate* timeStamp;

-(instancetype)initWithName: (NSString *) title
                   bodyText: (NSString *) bodyText;
//                  timeStamp: (NSDate *) timeStamp;
- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;
@end

NS_ASSUME_NONNULL_END
