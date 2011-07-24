//
//  AppScope.h
//  iShowTime
//
//  Created by Mathieu ROIG on 4/3/11.
//  Copyright 2011 Mathieu ROIG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CFDelegate;

@interface AppScope : NSObject {
	CFDelegate *appDelegate_;
	UITabBarController *tabController_;
}

@property(nonatomic,retain) CFDelegate *appDelegate;
@property (nonatomic, retain) UITabBarController *tabController;
@end