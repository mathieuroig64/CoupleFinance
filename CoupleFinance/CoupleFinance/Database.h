//
//  Database.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Database : NSObject{
  NSManagedObjectContext * context_;
}

@property (nonatomic, retain) NSManagedObjectContext * context;

// Init with context.
- (id)initWithContext:(NSManagedObjectContext*)moc;

@end
