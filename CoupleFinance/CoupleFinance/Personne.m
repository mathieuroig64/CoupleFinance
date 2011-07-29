//
//  Personne.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/29/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "Personne.h"

@implementation Personne
@synthesize udid = udid_;
@synthesize context = context_;

- (id)initWithContext:(NSManagedObjectContext*)context
{
  self = [super init];
  if (self) {
    context_ = [context retain];
  }
  return self;
}


//Add personne with UDID
- (Personne*) addPersonneWithUDID:(NSString*)udid{
  Personne * newPersonne = nil;
  if (![self getPersonneForUDID:udid]) {
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription 
                                   insertNewObjectForEntityForName:@"Personne" 
                                   inManagedObjectContext:context_];
  }
  return newPersonne;
}

//Get personne with UDID
- (Personne*) getPersonneForUDID:(NSString*)udid{
  NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Personne" 
																						inManagedObjectContext:context_];
	if (entity == nil) {
		return nil;
	}
	[fetchRequest setEntity:entity];
	NSPredicate *predicate = 
  [NSPredicate predicateWithFormat:@"udid == %@",udid];
	[fetchRequest setPredicate:predicate];
	NSError *error;
	NSArray *array = [context_ executeFetchRequest:fetchRequest error:&error];
	if (![array count]) {
		return nil;
	}
	Personne *thisPersonne = (Personne *)[array objectAtIndex:0];
	return thisPersonne;
}

- (void) dealloc{
  [udid_ release];
  [context_ release];
  [super dealloc];
}

@end
