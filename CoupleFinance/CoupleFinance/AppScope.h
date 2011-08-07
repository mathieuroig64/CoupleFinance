//
//  AppScope.h
//  iShowTime
//
//  Created by Mathieu ROIG on 4/3/11.
//  Copyright 2011 Mathieu ROIG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CFDelegate;
@class PersonneManager;

@interface AppScope : NSObject {
	CFDelegate *appDelegate_;
	UITabBarController *tabController_;
  NSManagedObjectContext *context_;
  PersonneManager * personneManager_;
}

@property (nonatomic, retain) CFDelegate *appDelegate;
@property (nonatomic, retain) UITabBarController *tabController;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) PersonneManager * personneManager;

- (id) initWithContext:(NSManagedObjectContext*)context;

@end