//
//  EDENAppDelegate.h
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDENAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow       *window;
@property (strong, atomic)    NSMutableArray *contacts;

@property (readonly, strong, nonatomic) NSManagedObjectContext       *context;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
