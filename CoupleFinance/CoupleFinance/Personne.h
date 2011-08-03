//
//  Personne.h
//  CoupleFinance
//
//  Created by Mathieu ROIG on 8/1/11.
//  Copyright (c) 2011 Apocope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Historique;

@interface Personne : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * udid;
@property (nonatomic, retain) Historique *historique;
@property (nonatomic, retain) NSSet *transactions;
@property (nonatomic, retain) NSManagedObject *partenaire;

// Add new personn to CD
- (Personne*) addNewPersonneWithUDID:(NSString*)udid
                             context:(NSManagedObjectContext*)context;

- (Personne*) getPersonneForUDID:(NSString*)udid
                         context:(NSManagedObjectContext*)context;

@end

@interface Personne (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(NSManagedObject *)value;
- (void)removeTransactionsObject:(NSManagedObject *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;
@end
