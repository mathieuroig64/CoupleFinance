//
//  TypeDef.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/28/11.
//  Copyright 2011 Apocope. All rights reserved.
//

@class AppScope;
@class CFInjector;
@class MesFinancesController;
@class MonCoupleController;
@class HistoriqueController;
@class AddTransactionController;

typedef UITabBarController* (^TabBarProvider)();
typedef MesFinancesController *(^MesFinancesControllerProvider)();
typedef MonCoupleController *(^MonCoupleControllerProvider)();
typedef HistoriqueController* (^HistoriqueControllerProvider)();
typedef AddTransactionController* (^AddTransactionControllerProvider)();