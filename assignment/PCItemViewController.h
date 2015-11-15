//
//  PCItemViewController.h
//  assignment
//
//  Created by Patrick Cunningham on 29/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCItem.h"

@interface PCItemViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) PCItem *item;

@end
