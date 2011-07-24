//
//  CFInjector.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppScope;
@class CFInjector;
@class MesFinancesController;
@class MonCoupleController;
@class HistoriqueController;

typedef UITabBarController* (^TabBarProvider)();
typedef MesFinancesController *(^MesFinancesControllerProvider)();
typedef MonCoupleController *(^MonCoupleControllerProvider)();
typedef HistoriqueController* (^HistoriqueControllerProvider)();

@interface CFInjector : NSObject


#pragma mark AppDelegate
+(CFInjector*)injectDelegate;

#pragma mark Appscope
+(AppScope*)injectAppScope;

#pragma mark TabBar
+(TabBarProvider)injectTabBarProvider:(AppScope*)appScope;
+(UITabBarController *)tabBarController:(AppScope*)appScope;
+(NSArray*)injectTabBarControllers:(AppScope*)appScope;


#pragma mark MesFinancesController
+(MesFinancesController*)injectMesFinancesController:(AppScope *)appScope;

#pragma mark MonCoupleController
+(MonCoupleController*)injectMonCoupleController:(AppScope *)appScope;

#pragma mark HistoriqueController
+(HistoriqueController*)injectHistoriqueController:(AppScope *)appScope;


@end
