//
//  WishListBrowserViewController.m
//  WishList
//
//  Created by Bennett Smith on 11/19/14.
//  Copyright (c) 2014 Bennett Smith. All rights reserved.
//

#import "WishListBrowserViewController.h"
#import "WishListItem.h"

@interface WishListBrowserViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WishListBrowserViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.wishListItem.url]];
}

@end
