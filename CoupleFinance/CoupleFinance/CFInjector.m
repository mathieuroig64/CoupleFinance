//
//  CFInjector.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "CFInjector.h"
#import "AppScope.h"
#import "CFDelegate.h"
#import "MesFinancesController.h"
#import "MonCoupleController.h"
#import "HistoriqueController.h"
#import "AddTransactionController.h"

@implementation CFInjector

#pragma mark AppDelegate
+(CFInjector*)injectDelegate{	
	AppScope* appScope = [CFInjector injectAppScope];
	
	UIWindow* window = [[[UIWindow alloc] 
                       initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
	
	TabBarProvider tabBarProvider = [CFInjector injectTabBarProvider:appScope];	
  
	CFDelegate* appDelegate = 
	[[CFDelegate alloc] initWithWindow:window 
											tabBarProvider:tabBarProvider
                             context:appScope.context];
  
  [appScope setAppDelegate:appDelegate];
	
	return [appDelegate autorelease];
}

#pragma mark Appscope
+(AppScope*)injectAppScope{
	AppScope* appScope = 
	[[AppScope alloc] initWithContext:[CFInjector injectContext]];
	return appScope;
}

#pragma mark TabBar
+(TabBarProvider)injectTabBarProvider:(AppScope*)appScope{
	TabBarProvider provider = ^(){
		UITabBarController *tab = [CFInjector tabBarController:appScope];
		[appScope setTabController:tab];
		return tab;
	};
	return [[provider copy] autorelease];	
}


+(UITabBarController *)tabBarController:(AppScope*)appScope{
	
	UITabBarController* tabBarController =
	[[[UITabBarController alloc] init] autorelease];
	
	NSMutableArray *tabControllers = [NSMutableArray array];
	
  UIImage *imgFinances = [UIImage imageNamed:@"finances.png"];
	UIImage *imgPartner = [UIImage imageNamed:@"couple.png"];
	UIImage *imgHistorique = [UIImage imageNamed:@"historique.png"];
	
	
	NSArray *images = [NSArray arrayWithObjects:
                     imgFinances, 
                     imgPartner, 
                     imgHistorique, 
                     nil];
	
	NSArray *titles = [NSArray arrayWithObjects:
                     @"Mes Finances",
                     @"Mon Couple",
                     @"Historique",
                     nil];
	
	NSArray *controllers = 
	[CFInjector injectTabBarControllers:appScope];
	
	for (int i =0; i < [controllers count]; i++) {
		UIViewController *viewcontroller = [controllers objectAtIndex:i];
		UITabBarItem* theItem = 
		[[[UITabBarItem alloc] initWithTitle:[titles objectAtIndex:i]
                                   image:[images objectAtIndex:i]
                                     tag:i] autorelease];
		UINavigationController *navcontroller = 
		[[[UINavigationController alloc] initWithRootViewController:viewcontroller] 
		 autorelease];
		viewcontroller.tabBarItem = theItem;
		navcontroller.tabBarItem = theItem;
		[tabControllers addObject:navcontroller];
	}
	tabBarController.viewControllers = tabControllers;
	[tabBarController setDelegate:appScope.appDelegate];	
	return tabBarController;
	
}

+(NSArray*)injectTabBarControllers:(AppScope*)appScope{
	
	MesFinancesController * financeController = 
	[CFInjector injectMesFinancesController:appScope];
  
	MonCoupleController * coupleController = 
	[CFInjector injectMonCoupleController:appScope];
	
	HistoriqueController * historiqueController =
	[CFInjector injectHistoriqueController:appScope];
	
  NSArray *viewControllers = [NSArray arrayWithObjects:
                              financeController,
                              coupleController,
                              historiqueController,
                              nil];
  return viewControllers;
}

#pragma mark MesFinancesController
+(MesFinancesController*)injectMesFinancesController:(AppScope *)appScope{
  
  AddTransactionControllerProvider addProvider = [CFInjector injectAddTransactionControllerProvider:appScope];
  
  MesFinancesController * controller = [[[MesFinancesController alloc] 
                                         initWithNibName:@"MesFinancesController" 
                                         bundle:nil
                                         addTransactionProvider:addProvider
                                         context:appScope.context] autorelease];
  return controller;
}

#pragma mark MonCoupleController
+(MonCoupleController*)injectMonCoupleController:(AppScope *)appScope{
  MonCoupleController * controller = [[[MonCoupleController alloc] 
                                       initWithNibName:@"MonCoupleController" 
                                       bundle:nil] autorelease];
  return controller;
}

#pragma mark HistoriqueController
+(HistoriqueController*)injectHistoriqueController:(AppScope *)appScope{
  HistoriqueController * controller = [[[HistoriqueController alloc] 
                                        initWithNibName:@"HistoriqueController" 
                                        bundle:nil] autorelease];
  return controller;  
}

#pragma mark AddTransactionController
+(AddTransactionControllerProvider)injectAddTransactionControllerProvider:(AppScope *)appScope{
  AddTransactionControllerProvider provider = ^() {
  	AddTransactionController *addController = 
		[[[AddTransactionController alloc] initWithNibName:@"AddTransactionController"
                                                bundle:nil] autorelease];
    
  	return addController;
	};
	return [[provider copy] autorelease];
}

#pragma mark -
#pragma mark Core Data
+(NSManagedObjectContext*)injectContext {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                       NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	NSString *strFilePath = 
	[basePath stringByAppendingPathComponent:@"/CoupleFinanace.db"];
	NSLog(@"%@",strFilePath);
	NSManagedObjectModel * managedObjectModel = 
	[NSManagedObjectModel mergedModelFromBundles:nil] ; 
	NSError *error;
	NSPersistentStoreCoordinator * persistentStoreCoordinator = 
	[[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel] 
	 autorelease];
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                configuration:nil 
                                                          URL:[NSURL fileURLWithPath:strFilePath]
                                                      options:nil 
                                                        error:&error]) {
		NSLog(@"Unable to addPersistentStoreWithType");
		exit(-1);
	} 
	NSManagedObjectContext *managedObjectContext = 
	[[[NSManagedObjectContext alloc] init] autorelease];
	[managedObjectContext setPersistentStoreCoordinator: persistentStoreCoordinator];
	return managedObjectContext;
}


@end
