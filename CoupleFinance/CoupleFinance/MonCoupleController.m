//
//  MonCoupleController.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "MonCoupleController.h"

@interface MonCoupleController (PrivateMethods)
- (void) addButtons;
- (void) didClickOnAddPartner;
@end

@implementation MonCoupleController

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
  [self.navigationItem setTitle:@"Mon Couple"];
  [self addButtons];
}

- (void) addButtons{
  UIBarButtonItem * addPartnerButton = [[[UIBarButtonItem alloc] 
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                        target:self 
                                         action:@selector(didClickOnAddPartner)] autorelease];
  [self.navigationItem setRightBarButtonItem:addPartnerButton];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBAction
- (void) didClickOnAddPartner{
  
}

@end
