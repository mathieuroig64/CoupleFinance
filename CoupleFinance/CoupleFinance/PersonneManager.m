//
//  PersonneManager.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/7/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "PersonneManager.h"
#import "PersonneCD.h"

@interface PersonneManager ()
- (PersonneCD*) getNewPersonne;
@end

@implementation PersonneManager
@synthesize context = context_;

// Init with context.
- (id)initWithContext:(NSManagedObjectContext*)moc{
  self = [super init];
  if (self) {
    context_ = [moc retain];
  }
  
  return self;
}

- (PersonneCD*) getNewPersonne{  
  return [NSEntityDescription insertNewObjectForEntityForName:@"PersonneCD"
                                       inManagedObjectContext:context_];
}

- (PersonneCD*) addNewPersonWithFirstName:(NSString*)firstName
                                 lastName:(NSString*)lastName
                                     udid:(NSString*)udid{
  PersonneCD * newPersonne = nil;
  newPersonne = [self getPersonneForUDID:udid];
  if (!newPersonne) {
    newPersonne = [self getNewPersonne];
    [newPersonne setUdid:udid];
    [newPersonne setPrenom:firstName];
    [newPersonne setNom:lastName];
    
    NSError ** error = nil;
    [context_ save:error];
    if (error) {
      NSLog(@"Error DB : %@", error);
    }
  }  
  return newPersonne;
}

- (PersonneCD*) getPersonneForFirstName:(NSString*)firstName
                               lastName:(NSString*)lastName{
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  
  NSEntityDescription *entity = 
  [NSEntityDescription entityForName:@"PersonneCD"
              inManagedObjectContext:context_];
  [fetchRequest setEntity:entity];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"prenom == %@ AND nom == %@",
                            firstName, lastName];
  [fetchRequest setPredicate:predicate];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context_ executeFetchRequest:fetchRequest error:&error];
  if (fetchedObjects == nil) {
    NSLog(@"error");
  }
  
  [fetchRequest release];
  PersonneCD * personne = [fetchedObjects objectAtIndex:0];
  return personne;
}


- (PersonneCD*) getPersonneForUDID:(NSString*)udid{
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  
  NSEntityDescription *entity = 
  [NSEntityDescription entityForName:@"PersonneCD"
              inManagedObjectContext:context_];
  [fetchRequest setEntity:entity];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"udid == %@",
                            udid];
  [fetchRequest setPredicate:predicate];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context_ executeFetchRequest:fetchRequest error:&error];
  if (fetchedObjects == nil) {
    NSLog(@"error");
  }
  
  if ([fetchedObjects count] > 0) {
    PersonneCD * personne = [fetchedObjects objectAtIndex:0];
    [fetchRequest release];
    return personne;    
  }else{
    [fetchRequest release];
    return nil;
  }
}



- (void) dealloc{
  [context_ release];
  [super dealloc];
}

@end
