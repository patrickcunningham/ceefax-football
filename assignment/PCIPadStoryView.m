//
//  PC_IPadStory.m
//  ceefaxFootball
//
//  Created by Patrick Cunningham on 10/02/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCIPadStoryView.h"

@implementation PCIPadStoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UITextView *storyTextView = [[UITextView alloc]
                                     initWithFrame:CGRectMake(20.0f, 170.0f, 600.0f, 100.0f)];
        
        storyTextView.backgroundColor = [UIColor blackColor];
        storyTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
        storyTextView.text = self.item.title;
        storyTextView.textColor = [UIColor whiteColor];
        storyTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:16];
        [self addSubview:storyTextView];
        
        storyTextView = [[UITextView alloc]
                         initWithFrame:CGRectMake(20.0f, 190.0f, 600.0f, 100.0f)];
        
        storyTextView.backgroundColor = [UIColor blackColor];
        storyTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
        storyTextView.text = self.item.description;
        storyTextView.textColor = [UIColor cyanColor];
        storyTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:16];
        [self addSubview:storyTextView];
        
        storyTextView = [[UITextView alloc]
                         initWithFrame:CGRectMake(20.0f, 290.0f, 600.0f, 100.0f)];
        
        storyTextView.backgroundColor = [UIColor blackColor];
        storyTextView.contentInset = UIEdgeInsetsMake(-8,-5,0,0);
        // make link selectable and editable
        storyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
        storyTextView.selectable = YES;
        storyTextView.editable = NO;
        [storyTextView setText:self.item.link];
        storyTextView.selectable = YES;
        storyTextView.scrollEnabled = YES;
        storyTextView.textColor = [UIColor cyanColor];
        storyTextView.font = [UIFont fontWithName:@"TIFAX-Alpha" size:16];
        [self addSubview:storyTextView];
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
