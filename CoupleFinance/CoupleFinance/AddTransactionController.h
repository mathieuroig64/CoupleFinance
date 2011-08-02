//
//  AddTransactionController.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Database;

@interface AddTransactionController : UIViewController {
  UITextField *amountTextField_;
  Database * database_;
}

@property (nonatomic, retain) IBOutlet UITextField *amountTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
             database:(Database*)database;

@end
