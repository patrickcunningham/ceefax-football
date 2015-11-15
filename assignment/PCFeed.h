//
//  PCFeed.h
//  assignment
//
//  Created by Patrick Cunningham on 28/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCChannel.h"
#import "PCItem.h"

@interface PCFeed : NSObject

// Feed consists of a channel and its items
@property (strong, nonatomic) PCChannel *channel;
@property (strong, nonatomic) NSMutableArray *items;

@end
