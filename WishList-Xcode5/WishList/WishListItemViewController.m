//
//  WishListItemViewController.m
//  WishList
//
//  Created by Bennett Smith on 11/19/14.
//  Copyright (c) 2014 Bennett Smith. All rights reserved.
//

#import "WishListItemViewController.h"
#import "WishListItem.h"

@interface WishListItemViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *wishListImage;
@property (weak, nonatomic) IBOutlet UILabel *wishListTitle;
@property (weak, nonatomic) IBOutlet UILabel *wishListURL;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong, nonatomic) NSDictionary *viewsDictionary;
@property (strong, nonatomic) NSArray *portraitConstraints;
@property (strong, nonatomic) NSArray *landscapeConstraints;
@property (strong, nonatomic) UIImage *favoriteImage;
@property (strong, nonatomic) UIImage *notFavoriteImage;
@end

@implementation WishListItemViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.wishListImage.image = self.wishListItem.image;
    self.wishListTitle.text = self.wishListItem.title;
    self.wishListURL.text = [self.wishListItem.url absoluteString];
    
    self.viewsDictionary = [self makeViewsDictionary];

    [self.wishListImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.wishListTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.wishListURL setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.portraitConstraints = [self makePortraitConstraints];
    self.landscapeConstraints = [self makeLandscapeConstraints];
    
    UIImage *favorite = [UIImage imageNamed:@"Favorite"];
    self.favoriteImage = [favorite imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImage *notFavorite = [UIImage imageNamed:@"NotFavorite"];
    self.notFavoriteImage = [notFavorite imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    [self.favoriteButton setTintColor:[UIColor redColor]];
    
    [self updateFavoriteButton];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];

    [self.view removeConstraints:self.portraitConstraints];
    [self.view removeConstraints:self.landscapeConstraints];
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        [self.view addConstraints:self.landscapeConstraints];
        [self.wishListImage setContentMode:UIViewContentModeScaleAspectFit];
    }
    else if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        [self.view addConstraints:self.portraitConstraints];
        [self.wishListImage setContentMode:UIViewContentModeScaleAspectFit];
    }
}

- (void)updateFavoriteButton {
    if (self.wishListItem.isFavorite == YES) {
        [self.favoriteButton setImage:self.favoriteImage forState:UIControlStateNormal];
        [self.favoriteButton setImage:self.favoriteImage forState:UIControlStateHighlighted];
        [self.favoriteButton setImage:self.notFavoriteImage forState:UIControlStateSelected];
    }
    else {
        [self.favoriteButton setImage:self.notFavoriteImage forState:UIControlStateNormal];
        [self.favoriteButton setImage:self.notFavoriteImage forState:UIControlStateHighlighted];
        [self.favoriteButton setImage:self.favoriteImage forState:UIControlStateSelected];
    }
}

- (IBAction)toggleFavorite:(id)sender {
    self.wishListItem.favorite = (self.wishListItem.isFavorite == YES ? NO : YES);
    [self updateFavoriteButton];
}

// *****************************************************************************
#pragma mark -                                                Constraint Helpers
// *****************************************************************************

- (NSArray *)makePortraitConstraints {
    NSArray *imageH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wishListImage]-|"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    NSArray *imageV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-[wishListImage]"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    
    /* Enforce a 4:3 aspect ratio for the image. */
    CGFloat standardSpacing = 20.0f;
    CGFloat computedHeight = ([self.view bounds].size.width / (4.0 / 3.0)) - (2 * standardSpacing);
    
    NSLayoutConstraint *imageHeightConstraint = [NSLayoutConstraint constraintWithItem:self.wishListImage
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1.0f
                                                                              constant:computedHeight];
    
    NSArray *favoriteH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[favorite]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewsDictionary];
    
    NSArray *favoriteV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[favorite]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewsDictionary];

    NSArray *titleH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wishListTitle]-|"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    NSArray *titleV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[wishListImage]-[wishListTitle]"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    
    NSArray *urlH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wishListURL]-|"
                                                            options:0
                                                            metrics:nil
                                                              views:self.viewsDictionary];
    NSArray *urlV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[wishListTitle]-[wishListURL]"
                                                            options:0
                                                            metrics:nil
                                                              views:self.viewsDictionary];
    
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:imageH];
    [constraints addObjectsFromArray:imageV];
    [constraints addObject:imageHeightConstraint];
    [constraints addObjectsFromArray:favoriteH];
    [constraints addObjectsFromArray:favoriteV];
    [constraints addObjectsFromArray:titleH];
    [constraints addObjectsFromArray:titleV];
    [constraints addObjectsFromArray:urlH];
    [constraints addObjectsFromArray:urlV];
    return [NSArray arrayWithArray:constraints];
}

- (NSArray *)makeLandscapeConstraints {
    NSArray *imageH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[wishListImage]|"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    NSArray *imageV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide][wishListImage]|"
                                                              options:0
                                                              metrics:nil
                                                                views:self.viewsDictionary];
    
    NSArray *favoriteH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[favorite]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewsDictionary];
    
    NSArray *favoriteV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[favorite]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewsDictionary];
    
    NSLayoutConstraint *wishListTitleWidth = [NSLayoutConstraint constraintWithItem:self.wishListTitle
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0f
                                                                           constant:0.0f];

    NSLayoutConstraint *wishListURLWidth = [NSLayoutConstraint constraintWithItem:self.wishListURL
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0f
                                                                         constant:0.0f];

    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:imageH];
    [constraints addObjectsFromArray:imageV];
    [constraints addObjectsFromArray:favoriteH];
    [constraints addObjectsFromArray:favoriteV];
    [constraints addObject:wishListTitleWidth];
    [constraints addObject:wishListURLWidth];
    return [NSArray arrayWithArray:constraints];
}

- (NSDictionary *)makeViewsDictionary {
    return @{ @"contentView": self.view,
              @"topLayoutGuide": self.topLayoutGuide,
              @"wishListImage": self.wishListImage,
              @"wishListTitle": self.wishListTitle,
              @"wishListURL": self.wishListURL,
              @"favorite": self.favoriteButton
              };
}

@end
