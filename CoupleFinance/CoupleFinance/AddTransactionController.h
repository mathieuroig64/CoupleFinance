//
//  AddTransactionController.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTransactionController : UIViewController {
  UITextField *amountTextField_;
}

@property (nonatomic, retain) IBOutlet UITextField *amountTextField;

@end
