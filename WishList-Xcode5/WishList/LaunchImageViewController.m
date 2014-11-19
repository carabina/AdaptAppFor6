//
//  LaunchImageViewController.m
//  WishList
//
//  Created by Bennett Smith on 11/19/14.
//  Copyright (c) 2014 Bennett Smith. All rights reserved.
//

#import "LaunchImageViewController.h"

@implementation LaunchImageViewController

- (void)viewWillAppear:(BOOL)animated {
    //[super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

- (void)viewWillDisappear:(BOOL)animated {
    //[super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}

@end
