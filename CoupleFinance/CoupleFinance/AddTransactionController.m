//
//  AddTransactionController.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "AddTransactionController.h"
#import "Database.h"

@interface AddTransactionController (PrivateMethods)
- (void) designButtons;
- (void) didClickOnCancel;
- (void) didClickOnOk;
- (void) configureAmountTextField;
- (void)addDot:(id)sender;
@end

@implementation AddTransactionController
@synthesize amountTextField = amountTextField_;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
             database:(Database*)database
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    database_ = [database retain];
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.navigationItem setTitle:@"Nouvelle Transaction"];
  [self designButtons];
  [self configureAmountTextField];
}


- (void) configureAmountTextField{
  [amountTextField_ setKeyboardType:UIKeyboardTypeDecimalPad];
}


- (void) designButtons{
  UIBarButtonItem * cancelButton = [[[UIBarButtonItem alloc] 
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                     target:self 
                                     action:@selector(didClickOnCancel)] autorelease];
  
  
  UIBarButtonItem * submitButton = [[[UIBarButtonItem alloc] 
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                                     target:self 
                                     action:@selector(didClickOnOk)] autorelease];
  
  
  [self.navigationItem setLeftBarButtonItem:cancelButton];
  [self.navigationItem setRightBarButtonItem:submitButton];
}


- (void)viewDidUnload
{
  [self setAmountTextField:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}


/**
 View will disappear
 **/
- (void)viewWillDisappear:(BOOL)animtated
{
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBAction
- (void) didClickOnCancel{
  [self dismissModalViewControllerAnimated:YES];
}

- (void) didClickOnOk{
  
}

- (void)dealloc {
  [database_ release];
  [amountTextField_ release];
  [super dealloc];
}
@end
