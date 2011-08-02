//
//  Partenaire.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Personne;

@interface Partenaire : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSString * prenom;
@property (nonatomic, retain) Personne *personne;

@end
