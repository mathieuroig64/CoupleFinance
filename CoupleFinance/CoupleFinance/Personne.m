//
//  Personne.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import "Personne.h"
#import "Historique.h"


@implementation Personne
@dynamic udid;
@dynamic historique;
@dynamic transactions;
@dynamic partenaire;


// Add new personn to CD
- (Personne*) addNewPersonneWithUDID:(NSString*)udid
                             context:(NSManagedObjectContext*)context{
  Personne * newPersonne = [NSEntityDescription insertNewObjectForEntityForName:@"Personne" 
                                                         inManagedObjectContext:context];
  [newPersonne setUdid:udid];
  
  NSError * error = nil;
  if (![context save:&error]) {
    NSLog(@"Error while saving Personne : %@", [error localizedDescription]);
  }
  return newPersonne;
}

- (Personne*) getPersonneForUDID:(NSString*)udid
                         context:(NSManagedObjectContext*)context{
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Personne"
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  if (fetchedObjects == nil) {
    NSLog(@"Error while fetching Personne : %@", [error localizedDescription]);
  }
  [fetchRequest release];

  Personne * personne = [fetchedObjects objectAtIndex:0];
  
  return personne;
}

@end
