//
//  main.m
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/24/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int retVal = UIApplicationMain(argc, argv, @"CFUIApplication", @"CFDelegate");
  [pool release];
  return retVal;
}
