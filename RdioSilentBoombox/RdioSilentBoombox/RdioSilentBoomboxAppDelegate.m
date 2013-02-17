//
//  RdioSilentBoomboxAppDelegate.m
//  RdioSilentBoombox
//
//  Created by Thomas Ituarte on 2/16/13.
//  Copyright (c) 2013 Thomas Ituarte. All rights reserved.
//

#import "RdioSilentBoomboxAppDelegate.h"
#import <Rdio/Rdio.h>
@interface RdioSilentBoomboxAppDelegate ()
@property (nonatomic) Rdio* rdio;
@end
@implementation RdioSilentBoomboxAppDelegate

@synthesize rdio = _rdio;

+ (Rdio*)rdioInstance
{
    return [(RdioSilentBoomboxAppDelegate*)[[UIApplication sharedApplication] delegate] rdio];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _rdio = [[Rdio alloc] initWithConsumerKey:@"8y8srnwxrygduabds79eyttm" andSecret:@"wznN2Qz6Je" delegate:nil];

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
    //_rdio = [[Rdio alloc] initWithConsumerKey:@"8y8srnwxrygduabds79eyttm" andSecret:@"wznN2Qz6Je" delegate:nil];
//    [_thisIsRdio.player playSource:@"t24376590"];

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- Rdio *rdio = [[Rdio alloc] initWithConsumerKey:@"YOUR KEY" andSecret:@"YOUR SECRET" delegate:nil];
//[rdio.player playSource:@"t2742133"];

@end