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

- (Personne*) getPersonForUDID:(NSString*)udid{
  return nil;
}

- (void) dealloc{
  [udid_ release];
  [super dealloc];
}

@end
