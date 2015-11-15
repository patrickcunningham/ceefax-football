//
//  PCRSSReader.h
//  assignment
//
//  Created by Patrick Cunningham on 28/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCFeed.h"
#import "PCChannel.h"
#import "PCItem.h"

@interface PCRSSReader : NSObject <NSXMLParserDelegate>

@property (strong,nonatomic) PCFeed *feed;

- (BOOL)parse;

@end
