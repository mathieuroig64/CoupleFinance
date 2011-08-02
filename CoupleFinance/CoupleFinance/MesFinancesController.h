//
//  MesFinancesController.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFInjector.h"

@class AddTransactionController;
@class Database;
@class Personne;

@interface MesFinancesController : UIViewController
<UITableViewDataSource, UITabBarDelegate>{
  @public
  UITableView * tableView_;
  
  @private
  NSArray * cellsHist_;
  NSArray * cellsNew_;
  AddTransactionControllerProvider addTransactionProvider_;
  Database * database_;
}

@property (nonatomic, retain) IBOutlet UITableView * tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
addTransactionProvider:(AddTransactionControllerProvider) addTransactionControllerProvider
             database:(Database*)database;

@end
