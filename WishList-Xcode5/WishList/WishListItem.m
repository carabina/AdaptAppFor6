//
//  WishListItem.m
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import "WishListItem.h"

@implementation WishListItem

- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url image:(UIImage *)image {
    self = [super init];
    if (self) {
        _title = [title copy];
        _url = [url copy];
        _image = [image copy];
    }
    return self;
}

@end
