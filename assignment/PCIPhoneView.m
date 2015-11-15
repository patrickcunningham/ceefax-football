//
//  PC_IPhoneView.m
//  ceefaxFootball
//
//  Created by Patrick Cunningham on 10/02/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCIPhoneView.h"
#import "PCRootViewController.h"
#import "PCAppDelegate.h"
#import "PCItemViewController.h"

@implementation PCIPhoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
               
        // Set date for layout
        NSDateFormatter *formatter;
        NSString        *dateString;
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd MMM yyyy HH:mm"];
        
        dateString = [formatter stringFromDate:[NSDate date]];
        
        // initialise text view and exact location
        UITextView *infoTextView = [[UITextView alloc]
                                    initWithFrame:CGRectMake(10.0f, 45.0f, 310.0f, 25.0f)];
        infoTextView.backgroundColor = [UIColor blackColor];
        infoTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
        infoTextView.textAlignment = NSTextAlignmentRight;
        infoTextView.text = dateString;
        infoTextView.textColor = [UIColor cyanColor];
        infoTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:8];
        [self addSubview:infoTextView];
        
        
        // Header layout
        // B
        UITextView *bbcTextView = [[UITextView alloc]
                            initWithFrame:CGRectMake(10.0f, 55.0f, 25.0f, 25.0f)];
        bbcTextView.backgroundColor = [UIColor whiteColor];
        bbcTextView.text = @"B";
        bbcTextView.textAlignment = NSTextAlignmentCenter;
        bbcTextView.textContainer.lineFragmentPadding = 0;
        bbcTextView.textContainerInset = UIEdgeInsetsZero;
        bbcTextView.textColor = [UIColor blackColor];
        bbcTextView.font = [UIFont fontWithName:@"Teletext-regular" size:30];
        [self addSubview:bbcTextView];
        
        // B
        bbcTextView = [[UITextView alloc]
                            initWithFrame:CGRectMake(40.0f, 55.0f, 25.0f, 25.0f)];
        bbcTextView.backgroundColor = [UIColor whiteColor];
        bbcTextView.text = @"B";
        bbcTextView.textAlignment = NSTextAlignmentCenter;
        bbcTextView.textContainer.lineFragmentPadding = 0;
        bbcTextView.textContainerInset = UIEdgeInsetsZero;
        bbcTextView.textColor = [UIColor blackColor];
        bbcTextView.font = [UIFont fontWithName:@"Teletext-regular" size:30];
        [self addSubview:bbcTextView];
        
        // C
        bbcTextView = [[UITextView alloc]
                            initWithFrame:CGRectMake(70.0f, 55.0f, 25.0f, 25.0f)];
        bbcTextView.backgroundColor = [UIColor whiteColor];
        bbcTextView.text = @"C";
        bbcTextView.textAlignment = NSTextAlignmentCenter;
        bbcTextView.textContainer.lineFragmentPadding = 0;
        bbcTextView.textContainerInset = UIEdgeInsetsZero;
        bbcTextView.textColor = [UIColor blackColor];
        bbcTextView.font = [UIFont fontWithName:@"Teletext-regular" size:30];
        [self addSubview:bbcTextView];
        
        // FOOTBALL
        UITextView *footballTextView = [[UITextView alloc]
                                 initWithFrame:CGRectMake(100.0f, 55.0f, 210.0f, 25.0f)];
        footballTextView.backgroundColor = [UIColor blueColor];
        footballTextView.text = @"FOOTBALL";
        footballTextView.textAlignment = NSTextAlignmentCenter;
        footballTextView.textContainer.lineFragmentPadding = 0;
        footballTextView.textContainerInset = UIEdgeInsetsZero;
        footballTextView.textColor = [UIColor greenColor];
        footballTextView.font = [UIFont fontWithName:@"Teletext-regular" size:30];
        [self addSubview:footballTextView];
    }
    return self;
}






/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
