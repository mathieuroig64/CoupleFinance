//
//  AppScope.h
//  iShowTime
//
//  Created by Mathieu ROIG on 4/3/11.
//  Copyright 2011 Mathieu ROIG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class CFDelegate;

@interface AppScope : NSObject {
	CFDelegate *appDelegate_;
	UITabBarController *tabController_;
  NSManagedObjectContext *context_;
}

@property (nonatomic, retain) CFDelegate *appDelegate;
@property (nonatomic, retain) UITabBarController *tabController;
@property (nonatomic, retain) NSManagedObjectContext *context;

- (id)initWithContext:(NSManagedObjectContext *)context;
@end