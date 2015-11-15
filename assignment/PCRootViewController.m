//
//  PCRootViewController.m
//  assignment
//
//  Created by Patrick Cunningham on 26/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCRootViewController.h"
#import "PCAppDelegate.h"
#import "PCItemViewController.h"
#import "PCIPhoneView.h"
#import "PCIPhoneHeadlinesView.h"
#import "PCIPadView.h"
#import "PCIPadHeadlinesView.h"


@interface PCRootViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *storyTextView;
@property (nonatomic, strong) UITextView *pageNoTextView;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) PCFeed *feed;
@property (nonatomic, strong) PCItem *item;


@end

@implementation PCRootViewController

#define MAXLENGTH 3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get feed object from AppDelegate
    PCAppDelegate *appDelegate = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.feed = appDelegate.feed;
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftRecognizer:)];
    swipeLeft.direction = (UISwipeGestureRecognizerDirectionLeft);
    [self.view addGestureRecognizer:swipeLeft];
    
    
    //TEST FOR DEVICE TYPE TO SET A PROPERTY TO MULTIPLY layout values
    NSString *deviceType = [UIDevice currentDevice].model;
    CGFloat deviceMultiplier = 0.0f;
    bool isIpad = FALSE;
    if([deviceType hasPrefix:@"iPad"]){
        deviceMultiplier = 1.5f;
        isIpad = TRUE;
    }
    
    if (isIpad == YES){
        // Create text field to enter page number
        self.textField = [[UITextField alloc]
                          initWithFrame:
                          CGRectMake(20.0f, 20.0f,
                                     120.0f, 60.0f)];
        self.textField.textColor = [UIColor blackColor];
        self.textField.font = [UIFont fontWithName:@"Teletext-regular" size:32];
        // adds focus to the field
        [self.textField becomeFirstResponder];
        self.textField.delegate = self;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        // add to view
        [self.view addSubview:self.textField];
        
        
        // intialise search button
        self.searchButton =
        [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.searchButton.backgroundColor = [UIColor blackColor];
        self.searchButton.tintColor = [UIColor whiteColor];
        [self.searchButton setTitle:@">" forState:UIControlStateNormal];
        self.searchButton.frame = CGRectMake(140.0f, 20.0f,
                                             120.0f, 60.0f);
        //set the target, action, and control event.
        [self.searchButton addTarget:self
                              action:@selector(buttonPressed)
                    forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.searchButton];
        
        PCIPadView *view = [[PCIPadView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:view];
        [self.view bringSubviewToFront:view];
        
        PCIPadHeadlinesView *headlinesView = [PCIPadHeadlinesView alloc];
        headlinesView.feed = self.feed;
        headlinesView = [headlinesView initWithFrame:self.view.frame];
        [self.view addSubview:headlinesView];
        [self.view bringSubviewToFront:headlinesView];
        
    } else {
        // Create text field to enter page number
        
        self.textField = [[UITextField alloc]
                          initWithFrame:
                          CGRectMake(10.0f, 10.0f,
                                     60.0f, 30.0f)];
        self.textField.textColor = [UIColor blackColor];
        self.textField.font = [UIFont fontWithName:@"Teletext-regular" size:16];
        // adds focus to the field
        [self.textField becomeFirstResponder];
        self.textField.delegate = self;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        // add to view
        [self.view addSubview:self.textField];
        
        
        // intialise search button
        self.searchButton =
        [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.searchButton.backgroundColor = [UIColor blackColor];
        self.searchButton.tintColor = [UIColor whiteColor];
        [self.searchButton setTitle:@">" forState:UIControlStateNormal];
        self.searchButton.frame = CGRectMake(70.0f, 10.0f,
                                             60.0f, 30.0f);
        //set the target, action, and control event.
        [self.searchButton addTarget:self
                              action:@selector(buttonPressed)
                    forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.searchButton];
        
        PCIPhoneView *view = [[PCIPhoneView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:view];
        [self.view bringSubviewToFront:view];
        
        PCIPhoneHeadlinesView *headlinesView = [PCIPhoneHeadlinesView alloc];
        headlinesView.feed = self.feed;
        headlinesView = [headlinesView initWithFrame:self.view.frame];
        [self.view addSubview:headlinesView];
        [self.view bringSubviewToFront:headlinesView];
    }
    
}

- (void) swipeLeftRecognizer:(UISwipeGestureRecognizer *)sender {
    
    NSString *search = @"303";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.pageNo contains[cd] %@", search];
    NSArray *filtered = [self.feed.items filteredArrayUsingPredicate:predicate];
    PCItem *nextItem = (PCItem*)[filtered objectAtIndex:0];
    PCItemViewController *viewController = [[PCItemViewController alloc] init];
    viewController.item = nextItem;
    [self presentViewController:viewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //this tells the operating system to remove
    //the keyboard from the forefront
    [textField resignFirstResponder];
    //call buttonPressed method
    [self buttonPressed];
    
    //returns NO. Instead of adding a line break,
    //the text field resigns
    return NO;
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Ensure textField only has three characters
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    [self buttonPressed];
    
    return newLength <= 3 || returnKey;
}

- (void)buttonPressed {
    // check page number entered is in list
    for (PCItem *item in self.feed.items) {
        if ([item.pageNo isEqualToString:self.textField.text]) {
            // if so load controller with that item
            PCItemViewController *viewController = [[PCItemViewController alloc] init];
            viewController.item = item;
            [self presentViewController:viewController animated:YES completion:nil];
        }
    }
}

@end
