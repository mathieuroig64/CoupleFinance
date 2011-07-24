//
//  MesFinancesController.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "MesFinancesController.h"
#import "NewTransactionCell.h"
#import "UIView+XIBLoading.h"
#import "AddTransactionController.h"

@interface MesFinancesController (PrivateMethods)
- (void) configureCells;
- (NewTransactionCell*) configureNewTransactionCell;
@end

@implementation MesFinancesController
@synthesize tableView = tableView_;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
addTransactionProvider:(AddTransactionControllerProvider) addTransactionProvider
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    addTransactionProvider_ = [addTransactionProvider copy];
  }
  return self;
}

- (void) dealloc{
  [tableView_ release];
  [cellsHist_ release];
  [cellsNew_ release];
  [addTransactionProvider_ release];
  [super dealloc];
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
  [self.navigationItem setTitle:@"Mes Finances"];
  
  //Configure cells
  [self configureCells];
}

#pragma mark Datas
- (void) configureCells{
  cellsNew_ = [[NSArray arrayWithObjects:[self configureNewTransactionCell], nil] retain];
}


- (NewTransactionCell*) configureNewTransactionCell{
  NewTransactionCell * cell = [NewTransactionCell loadXIB:@"NewTransactionCell" 
                                                 forClass:[NewTransactionCell class]];
  return cell;
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark UITableViewDelegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  switch (section) {
    case 0:
      return [cellsNew_ count];
      break;
      
    case 1:
      return [cellsHist_ count];
      break;
      
    default:
      return 0;
      break;
  }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  NSString * title  = nil;
  switch (section) {
    case 0:
      title = @"Nouvelle transaction";
      break;
      
    case 1:
      title = @"Transactions précédentes";
      break;
      
    default:
      break;
  }
  
  return title;
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell * cell;
  switch (indexPath.section) {
    case 0:
      cell = (NewTransactionCell*)[cellsNew_ objectAtIndex:indexPath.row];
      return cell.frame.size.height;
      break;
      
    case 1:
      cell = [cellsHist_ objectAtIndex:indexPath.row];
      return cell.frame.size.height;      
      break;
      
    default:
      return 0;
      break;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.section) {
    case 0:
      return [cellsNew_ objectAtIndex:indexPath.row];
      break;
      
    case 1:
      return [cellsHist_ objectAtIndex:indexPath.row];
      break;
      
    default:
      return nil;
      break;
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == 0){
    AddTransactionController * addController = addTransactionProvider_();
    UINavigationController * navController = [[[UINavigationController alloc] 
                                               initWithRootViewController:addController] autorelease];
    [self.navigationController presentModalViewController:navController animated:YES];
  }else if (indexPath.section == 1){
    
  }
  [tableView_ deselectRowAtIndexPath:indexPath animated:YES];
}


@end
