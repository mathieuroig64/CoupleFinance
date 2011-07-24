//
//  AddTransactionController.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "AddTransactionController.h"

@interface AddTransactionController (PrivateMethods)
- (void) designButtons;
- (void) didClickOnCancel;
- (void) didClickOnOk;
- (void) configureAmountTextField;
- (void)addDot:(id)sender;
@end

@implementation AddTransactionController
@synthesize amountTextField = amountTextField_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
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
}

- (void)viewWillAppear:(BOOL)animtated
{
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2)
  {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
  }
  else
  {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  }
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
 The Keyboard will be shown
 **/
- (void)keyboardWillShow:(NSNotification *)notification
{
  if ([amountTextField_ isFirstResponder])
  {
    // Skip for Notes keyboard
    return;
  }
  
  // Locate fist view
  UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
  UIView *keyboard;
  
  // Define Button
  UIButton * utilityButton = [UIButton buttonWithType:UIButtonTypeCustom];
  utilityButton.frame = CGRectMake(0, 163, 105, 53);
  
  // Set Text and font
  [utilityButton.titleLabel setFont:[UIFont systemFontOfSize:35]];
  [utilityButton setTitle:@"." forState:UIControlStateNormal];
  
  // Set Solors
  [utilityButton setTitleColor:[UIColor colorWithRed:77.0f/255.0f green:84.0f/255.0f blue:98.0f/255.0f alpha:1.0] forState:UIControlStateNormal]; 
  [utilityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
  
  // Background for the pressed state
  [utilityButton setBackgroundImage:[UIImage imageNamed:@"background.png"] forState:UIControlStateHighlighted];
  
  // Add call to functionality
  [utilityButton addTarget:self action:@selector(addDecimalPointToField) forControlEvents:UIControlEventTouchUpInside];
  
  // Behavior when orientation is changed
  [utilityButton setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight)];
  
  // Locate keyboard view and add button
  for(int i=0; i<[tempWindow.subviews count]; i++)
  {
    keyboard = [tempWindow.subviews objectAtIndex:i];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2)
    {
      if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
      {
        [keyboard addSubview:utilityButton];
      }
    }
    else
    {
      if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
      {
        [keyboard addSubview:utilityButton];
      }
    }
  }
}

/**
 Send Decimal Point event to field with focus
 **/
- (void)addDecimalPointToField
{
  UIView * objectToEdit = nil;
  
  // Locate field with the focus
  for (UIView * localView in self.view.subviews)
  {
    if ([localView isFirstResponder])
    {
      objectToEdit = localView;
    }
  }
  
  // Try to insert dot
  if (objectToEdit != nil)
  {
    // Detect if the Dot has been already inserted
    
    NSString * localText = [(UITextField *)objectToEdit text];
    
    NSRange separatorPosition = [localText rangeOfString:@"."];
    
    if (separatorPosition.location == NSNotFound)
    {
      // Dot wasn't found, add it
      [objectToEdit insertText:[NSString stringWithFormat:@"."]];
    }
  }
}


/**
 View will disappear
 **/
- (void)viewWillDisappear:(BOOL)animtated
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
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
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [amountTextField_ release];
  [super dealloc];
}
@end
