//
//  WishListItemCell.h
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishListItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *wishListImage;
@property (weak, nonatomic) IBOutlet UILabel *wishListTitle;
@property (weak, nonatomic) IBOutlet UILabel *wishListURL;
@end
