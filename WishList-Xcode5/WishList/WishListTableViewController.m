//
//  WishListTableViewController.m
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import "WishListTableViewController.h"
#import "WishListItemViewController.h"
#import "WishListBrowserViewController.h"

#import "WishListItem.h"
#import "WishListItemCell.h"

@interface WishListTableViewController ()
@end

@implementation WishListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewWishListItem"]) {
        WishListItemViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        vc.wishListItem = [self wishListItemForIndexPath:indexPath];
    }
    else if ([segue.identifier isEqualToString:@"browseWishListItemSite"]) {
        WishListBrowserViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        vc.wishListItem = [self wishListItemForIndexPath:indexPath];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.wishListItems count];
}

- (WishListItem *)wishListItemForIndexPath:(NSIndexPath *)indexPath {
    return (WishListItem *)[self.wishListItems objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WishListItemCell *cell = (WishListItemCell *)[tableView dequeueReusableCellWithIdentifier:@"WishListItem" forIndexPath:indexPath];
    
    WishListItem *item = [self wishListItemForIndexPath:indexPath];

    cell.wishListTitle.text = item.title;
    cell.wishListURL.text = [item.url absoluteString];
    cell.wishListImage.image = item.image;

    return cell;
}

@end
