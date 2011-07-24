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
#import "HistoriqueController.h"

@implementation CFInjector

#pragma mark AppDelegate
+(CFInjector*)injectDelegate{	
	AppScope* appScope = [CFInjector injectAppScope];
	
	UIWindow* window = [[[UIWindow alloc] 
                       initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
	
	TabBarProvider tabBarProvider = [CFInjector injectTabBarProvider:appScope];	
  
	CFDelegate* appDelegate = 
	[[CFDelegate alloc] initWithWindow:window 
											tabBarProvider:tabBarProvider];
  
  [appScope setAppDelegate:appDelegate];
	
	return [appDelegate autorelease];
}

#pragma mark Appscope
+(AppScope*)injectAppScope{
	AppScope* appScope = 
	[[[AppScope alloc] init] autorelease];
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
  MesFinancesController * controller = [[[MesFinancesController alloc] 
                                         initWithNibName:@"MesFinancesController" 
                                         bundle:nil] autorelease];
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


@end
