//
//  CoupleFinanceAppDelegate.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeDef.h"

@interface CFDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>{
@public
  UIWindow * window_;
  
@private
	UITabBarController *tabBarController_;
	TabBarProvider tabBarProvider_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(id)initWithWindow:(UIWindow*)mainWindow
     tabBarProvider:(TabBarProvider)tabBarProvider;


@end
