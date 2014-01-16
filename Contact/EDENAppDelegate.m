//
//  EDENAppDelegate.m
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENAppDelegate.h"
#import "EDENContactListViewController.h"
#import "EDENContactsMapViewController.h"

@implementation EDENAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray * directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentDiretory = directories[0];
    self.fileName = [NSString stringWithFormat:@"%@/Contacts.data", documentDiretory];
    
    self.contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:self.fileName];
    if (!self.contacts) {
        self.contacts = [[NSMutableArray alloc] init];
    }
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds ];
    
    EDENContactListViewController * contactList = [[EDENContactListViewController alloc] init];
    contactList.contacts = self.contacts;
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:contactList];
    
    EDENContactsMapViewController * mapController = [[EDENContactsMapViewController alloc] init];
    mapController.contacts = self.contacts;
    
    UINavigationController * mapNavigationController = [[UINavigationController alloc] initWithRootViewController:mapController];
    
    UITabBarController * tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = @[navigationController, mapNavigationController];
    
    self.window.rootViewController = tabController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:self.fileName];
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
