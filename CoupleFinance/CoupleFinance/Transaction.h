//
//  Transaction.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Transaction : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * valeur;
@property (nonatomic, retain) NSManagedObject *historique;
@property (nonatomic, retain) NSManagedObject *personne;

@end
