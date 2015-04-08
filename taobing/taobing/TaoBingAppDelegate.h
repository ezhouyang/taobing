//
//  TaoBingAppDelegate.h
//  taobing
//
//  Created by yang.zy on 15-3-31.
//  Copyright (c) 2015年 taobing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaoBingRootViewController;

@interface TaoBingAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TaoBingRootViewController *rootViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
