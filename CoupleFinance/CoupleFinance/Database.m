//
//  Database.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import "Database.h"

@implementation Database
@synthesize context = context_;

// Init with context.
- (id)initWithContext:(NSManagedObjectContext*)moc{
  self = [super init];
  if (self) {
    context_ = [moc retain];
  }
  
  return self;
}


- (void) dealloc{
  [context_ release];
  [super dealloc];
}

@end
