//
//  HistoriqueCD.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/7/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonneCD, TransactionCD;

@interface HistoriqueCD : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * debutPeriode;
@property (nonatomic, retain) NSDate * finPeriode;
@property (nonatomic, retain) PersonneCD *personne;
@property (nonatomic, retain) NSSet *transactions;
@end

@interface HistoriqueCD (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(TransactionCD *)value;
- (void)removeTransactionsObject:(TransactionCD *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;
@end
