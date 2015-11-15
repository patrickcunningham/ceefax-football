//
//  PCItem.h
//  assignment
//
//  Created by Patrick Cunningham on 28/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCItem : NSObject

// Item fields needed for app are title, description, link, pubDate and the pageNo which is calculated after parsing
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSString *pubDate;
@property (strong, nonatomic) NSString *pageNo;

@end
