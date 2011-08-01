//
//  Personne.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 7/29/11.
//  Copyright 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject{
  //Udid
  NSString * udid_;
}
@property (nonatomic, retain) NSString * udid;

//Find a person
- (Personne*) getPersonForUDID:(NSString*)udid;

@end
