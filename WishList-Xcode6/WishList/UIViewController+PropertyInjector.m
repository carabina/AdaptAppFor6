//
//  UIViewController+PropertyInjector.m
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import "UIViewController+PropertyInjector.h"

@implementation UIViewController (PropertyInjector)

- (void)injectValue:(id)value forKey:(NSString *)key {
    UIViewController *injectionSite = nil;
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)self;
        injectionSite = [navController.viewControllers firstObject];
    }
    else {
        injectionSite = self;
    }

    if (injectionSite) {
        @try {
            [injectionSite setValue:value forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"Property injectionfailed with exception => '%@'", exception.reason);
        }
    }
}

@end
