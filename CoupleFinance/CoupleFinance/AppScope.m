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
<<<<<<< HEAD
@synthesize database = database_;
=======

>>>>>>> parent of e94a0bc... Personnne

-(void)dealloc{
	[tabController_ release];
	[appDelegate_ release];
	[super dealloc];
}


@end
