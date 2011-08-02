//
//  Historique.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Historique : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * debutPeriode;
@property (nonatomic, retain) NSDate * finPeriode;
@property (nonatomic, retain) NSManagedObject *personne;
@property (nonatomic, retain) NSSet *transactions;
@end

@interface Historique (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(NSManagedObject *)value;
- (void)removeTransactionsObject:(NSManagedObject *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;
@end
