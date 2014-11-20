//
//  WishListItem.h
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishListItem : NSObject
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, assign, getter = isFavorite) BOOL favorite;
- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url image:(UIImage *)image;
@end
