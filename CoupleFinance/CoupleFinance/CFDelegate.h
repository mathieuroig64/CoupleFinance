//
//  CoupleFinanceAppDelegate.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>{
@public
  UIWindow * window_;
  
@private
	UITabBarController *tabBarController_;
	UITabBarController* (^tabBarProvider_)();
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(id)initWithWindow:(UIWindow*)mainWindow
     tabBarProvider:(UITabBarController* (^)())tabBarProvider;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
