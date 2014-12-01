//
//  AppDelegate.m
//  WishList
//
//  Created by Bennett Smith on 11/19/14.
//  Copyright (c) 2014 Bennett Smith. All rights reserved.
//

#import "AppDelegate.h"
#import "WishListItem.h"
#import "UIViewController+PropertyInjector.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    WishListItem *tesla = [[WishListItem alloc] initWithTitle:@"Tesla Model S" url:[NSURL URLWithString:@"http://www.teslamotors.com/models"] image:[UIImage imageNamed:@"tesla"]];
    WishListItem *minicooper = [[WishListItem alloc] initWithTitle:@"Mini Cooper Countryman" url:[NSURL URLWithString:@"http://www.miniusa.com/content/miniusa/en/model/countryman.html"] image:[UIImage imageNamed:@"minicooper"]];
    WishListItem *ipadair2 = [[WishListItem alloc] initWithTitle:@"iPadAir 2" url:[NSURL URLWithString:@"http://www.apple.com/ipad-air-2/"] image:[UIImage imageNamed:@"ipadair2"]];
    WishListItem *imac5k = [[WishListItem alloc] initWithTitle:@"iMac with Retina 5K display" url:[NSURL URLWithString:@"http://www.apple.com/imac-with-retina/"] image:[UIImage imageNamed:@"imac5k"]];
    WishListItem *applewatch = [[WishListItem alloc] initWithTitle:@" Watch" url:[NSURL URLWithString:@"http://www.apple.com/watch/"] image:[UIImage imageNamed:@"applewatch"]];
    
    NSMutableArray *wishListItems = [NSMutableArray arrayWithArray:@[tesla, minicooper, ipadair2, imac5k, applewatch]];
    
    UIViewController *rootViewController = self.window.rootViewController;
    
    [rootViewController injectValue:wishListItems forKey:@"wishListItems"];
    
    NSLog(@"Window bounds = %@", NSStringFromCGRect(self.window.bounds));
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
