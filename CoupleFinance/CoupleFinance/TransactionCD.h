//
//  TransactionCD.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/7/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HistoriqueCD, PersonneCD;

@interface TransactionCD : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * valeur;
@property (nonatomic, retain) HistoriqueCD *historique;
@property (nonatomic, retain) PersonneCD *personne;

@end
