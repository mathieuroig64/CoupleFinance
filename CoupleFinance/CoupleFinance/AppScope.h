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
<<<<<<< HEAD
  sqlite3 * database_;
=======
>>>>>>> parent of e94a0bc... Personnne
}

@property (nonatomic, retain) CFDelegate *appDelegate;
@property (nonatomic, retain) UITabBarController *tabController;
<<<<<<< HEAD
@property (nonatomic, assign) sqlite3 * database;

=======
>>>>>>> parent of e94a0bc... Personnne
@end