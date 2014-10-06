//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Allen Snook on 10/3/14.
//  Copyright (c) 2014 Automattic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITextView *redView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *greenView;

@end

@implementation ViewController

- (void)loadView
{
    // Note: since we are constructing self.view, we do not want to call [super loadView]
    self.title = @"Wut?";
    
    // Create the root view as a scroll view
    self.view = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.redView = [[UITextView alloc] init];
    self.redView.text = @"First line\nSecond line\nThird line\nFourth line";
    self.blueView = [[UIView alloc] init];
    self.greenView = [[UIView alloc] init];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.3 alpha:1];

    // New to iOS7 - YES is the default - to let the scrollview content start initially below the nav bar
    // self.automaticallyAdjustsScrollViewInsets = YES;
    
    // Since we turned off translating the auto resizing mask into constraints, we need to add them
    NSDictionary *views = @{@"redview": self.redView,
                            @"blueview": self.blueView,
                            @"greenview": self.greenView
                            };

    self.redView.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.5 alpha:0.8];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.view addSubview:self.redView];
    
    self.blueView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:0.8];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.view addSubview:self.blueView];
    
    self.greenView.backgroundColor = [UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:0.8];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.view addSubview:self.greenView];
    
    // Pin the redView width to the root view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView 
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0]];

    // Pin the blueView width to the root view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView 
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0]];

    // Pin the greenView width to the root view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView 
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0]];

    // Set some interesting heights for the views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[redview(300)]-[blueview(300)]-[greenview(300)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    // Because we set all those constraints, we don't need to worry about doing
    // something like this: self.scrollView.contentSize = CGSizeMake(400,920);
}

@end
