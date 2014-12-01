//
//  UIViewController+PropertyInjector.h
//  FrameworkExplorer
//
//  Created by Bennett Smith on 10/17/14.
//  Copyright (c) 2014 iOS Weekend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PropertyInjector)
- (void)injectValue:(id)value forKey:(NSString *)key;
@end
