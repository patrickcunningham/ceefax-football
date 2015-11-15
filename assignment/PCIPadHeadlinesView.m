//
//  PC_IPadHeadlines.m
//  ceefaxFootball
//
//  Created by Patrick Cunningham on 10/02/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCIPadHeadlinesView.h"

@implementation PCIPadHeadlinesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat y = 170.0f;
        CGFloat counter = 0;
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        UITextView *storyTextView;
        
        for (PCItem *story in self.feed.items) {
            
            if (counter == 0) {
                storyTextView = [[UITextView alloc]
                                 initWithFrame:CGRectMake(20.0f, y, 600.0f, 40.0f)];
                y = y + (2);
                storyTextView.backgroundColor = [UIColor blackColor];
                storyTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
                storyTextView.text = story.title.uppercaseString;
                storyTextView.textColor = [UIColor whiteColor];
                storyTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:20];
            } else {
                storyTextView = [[UITextView alloc]
                                 initWithFrame:CGRectMake(20.0f, y, 600.0f, 40.0f)];
                
                storyTextView.backgroundColor = [UIColor blackColor];
                storyTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
                storyTextView.text = story.title;
                storyTextView.textColor = [UIColor cyanColor];
                storyTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:16];
            }
            [self addSubview:storyTextView];
            
            UITextView *pageNoTextView = [[UITextView alloc]
                                          initWithFrame:CGRectMake((screenWidth -60.0f), y, 60.0f, 40.0f)];
            pageNoTextView.backgroundColor = [UIColor blackColor];
            pageNoTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
            pageNoTextView.text = story.pageNo;
            pageNoTextView.textColor = [UIColor whiteColor];
            pageNoTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:16];
            [self addSubview:pageNoTextView];
            
            y = y + (20.0f);
            counter++;
        }
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
