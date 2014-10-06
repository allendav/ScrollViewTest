//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Allen Snook on 10/3/14.
//  Copyright (c) 2014 Automattic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *greenView;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    self.title = @"Wut?";
    
    self.scrollView = [[UIScrollView alloc] init];
    self.redView = [[UIView alloc] init];
    self.blueView = [[UIView alloc] init];
    self.greenView = [[UIView alloc] init];

    self.scrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.3 alpha:1];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to define them below 

    // New to iOS7 - YES is the default - to let the scrollview content start initially below the nav bar
    // self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.scrollView];
    
    // Since we turned off translating the auto resizing mask into constraints, we need to add them
    NSDictionary *views = @{@"scrollview": self.scrollView,
                            @"redview": self.redView,
                            @"blueview": self.blueView,
                            @"greenview": self.greenView
                            };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollview]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollview]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    self.redView.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.5 alpha:0.8];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.scrollView addSubview:self.redView];
    
    self.blueView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:0.8];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.scrollView addSubview:self.blueView];
    
    self.greenView.backgroundColor = [UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:0.8];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO; // we're going to do it below
    [self.scrollView addSubview:self.greenView];
    
    // Pin the redView width to the container (superview) width (not the scroll view)
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView 
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0]];

    // Pin the blueView width to the container (superview) width (not the scroll view)
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView 
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0]];

    // Pin the greenView width to the container (superview) width (not the scroll view)
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
