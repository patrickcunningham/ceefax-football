//
//  PCAppDelegate.h
//  assignment
//
//  Created by Patrick Cunningham on 26/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCFeed.h"
#import <CoreLocation/CoreLocation.h>

@interface PCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PCFeed *feed;

@end
