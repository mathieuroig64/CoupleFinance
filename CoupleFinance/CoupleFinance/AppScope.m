//
//  AppScope.m
//  iShowTime
//
//  Created by Mathieu ROIG on 4/3/11.
//  Copyright 2011 Mathieu ROIG. All rights reserved.
//

#import "AppScope.h"


@implementation AppScope
@synthesize appDelegate = appDelegate_;
@synthesize tabController = tabController_;
@synthesize context = context_;
@synthesize database = database_;

- (id) initWithContext:(NSManagedObjectContext*)context{
  self = [super init];
  if (self) {
    context_ = [context retain];
  }
  return self;
}

-(void)dealloc{
  [database_ release];
	[tabController_ release];
	[appDelegate_ release];
  [context_ release];
	[super dealloc];
}


@end
