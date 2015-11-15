//
//  PCItemViewController.m
//  assignment
//
//  Created by Patrick Cunningham on 29/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCItemViewController.h"
#import "PCAppDelegate.h"
#import "PCRootViewController.h"
#import "PCIPhoneView.h"
#import "PCIPadView.h"
#import "PCIPhoneStoryView.h"
#import "PCIPadHeadlinesView.h"
#import "PCIPadStoryView.h"

@interface PCItemViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) PCFeed *feed;

@end

@implementation PCItemViewController

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
    
    PCAppDelegate *appDelegate = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.feed = appDelegate.feed;
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftRecognizer:)];
    swipeLeft.direction = (UISwipeGestureRecognizerDirectionLeft);
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightRecognizer:)];
    swipeRight.direction = (UISwipeGestureRecognizerDirectionRight);
    [self.view addGestureRecognizer:swipeRight];
    
    
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
        self.textField.text = self.item.pageNo;
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
        
        PCIPadStoryView *storyView = [PCIPadStoryView alloc];
        storyView.item = self.item;
        storyView = [storyView initWithFrame:self.view.frame];
        [self.view addSubview:storyView];
        [self.view bringSubviewToFront:storyView];
        
    } else {
        // Create text field to enter page number
        self.textField = [[UITextField alloc]
                          initWithFrame:
                          CGRectMake(10.0f, 10.0f,
                                     60.0f, 30.0f)];
        self.textField.textColor = [UIColor blackColor];
        self.textField.font = [UIFont fontWithName:@"Teletext-regular" size:16];
        self.textField.text = self.item.pageNo;
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
        
        PCIPhoneStoryView *storyView = [PCIPhoneStoryView alloc];
        storyView.item = self.item;
        storyView = [storyView initWithFrame:self.view.frame];
        [self.view addSubview:storyView];
        [self.view bringSubviewToFront:storyView];
        
    }
    
    

}

- (void) swipeLeftRecognizer:(UISwipeGestureRecognizer *)sender {
    
    if ([self.item.pageNo isEqualToString:@"322"]) {
        PCRootViewController *viewController = [[PCRootViewController alloc] init];
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        NSString *search = [NSString stringWithFormat:@"%d", [self.item.pageNo intValue] + 1];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.pageNo contains[cd] %@", search];
        NSArray *filtered = [self.feed.items filteredArrayUsingPredicate:predicate];
        PCItem *nextItem = (PCItem*)[filtered objectAtIndex:0];
        PCItemViewController *viewController = [[PCItemViewController alloc] init];
        viewController.item = nextItem;
        [self presentViewController:viewController animated:YES completion:nil];
    }
    
   
}

- (void) swipeRightRecognizer:(UISwipeGestureRecognizer *)sender {
    
    if ([self.item.pageNo isEqualToString:@"303"]) {
        PCRootViewController *viewController = [[PCRootViewController alloc] init];
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        NSString *search = [NSString stringWithFormat:@"%d", [self.item.pageNo intValue] - 1];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.pageNo contains[cd] %@", search];
        NSArray *filtered = [self.feed.items filteredArrayUsingPredicate:predicate];
        PCItem *nextItem = (PCItem*)[filtered objectAtIndex:0];
     
        PCItemViewController *viewController = [[PCItemViewController alloc] init];
        viewController.item = nextItem;
        [self presentViewController:viewController animated:YES completion:nil];
    }
    
    
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
    // call buttonPressed method
    [self buttonPressed];
    
    //returns NO. Instead of adding a line break,
    //the text field resigns
    return NO;
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= 3 || returnKey;
}

- (void)buttonPressed {
    // check page number is valid
    if ([self.textField.text isEqualToString:@"302"]){
        // if 302 load headlines page
        PCRootViewController *viewController = [[PCRootViewController alloc] init];
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        // if valid load item view page
        for (PCItem *item in self.feed.items) {
            if ([item.pageNo isEqualToString:self.textField.text]) {
                PCItemViewController *viewController = [[PCItemViewController alloc] init];
                viewController.item = item;
                [self presentViewController:viewController animated:YES completion:nil];
            }
            
        }
    }
    // otherwise do nothing
}

@end
