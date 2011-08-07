//
//  PersonneCD.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/7/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HistoriqueCD, PersonneCD, TransactionCD;

@interface PersonneCD : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * udid;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSString * prenom;
@property (nonatomic, retain) HistoriqueCD *historique;
@property (nonatomic, retain) PersonneCD *partenaire;
@property (nonatomic, retain) NSSet *transactions;
@end

@interface PersonneCD (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(TransactionCD *)value;
- (void)removeTransactionsObject:(TransactionCD *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;
@end
