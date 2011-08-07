//
//  PersonneManager.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/7/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonneCD;
@interface PersonneManager : NSObject{
  NSManagedObjectContext * context_;
}

@property (nonatomic, retain) NSManagedObjectContext * context;

// Init with context.
- (id)initWithContext:(NSManagedObjectContext*)moc;

//Add new Personne
- (PersonneCD*) addNewPersonWithFirstName:(NSString*)firstName
                                 lastName:(NSString*)lastName
                                     udid:(NSString*)udid;

- (PersonneCD*) getPersonneForFirstName:(NSString*)firstName
                               lastName:(NSString*)lastName;


- (PersonneCD*) getPersonneForUDID:(NSString*)udid;

@end
