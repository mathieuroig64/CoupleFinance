//
//  Personne.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/29/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject{
  //Udid
  NSString * udid_;
  //Manage Object
  NSManagedObjectContext * context_;
}

- (id)initWithContext:(NSManagedObjectContext*)context;

//Add personne with UDID
- (Personne*) addPersonneWithUDID:(NSString*)udid;

//Get personne with UDID
- (Personne*) getPersonneForUDID:(NSString*)udid;

@property (nonatomic, retain) NSString * udid;
@property (nonatomic, retain) NSManagedObjectContext * context;
@end
