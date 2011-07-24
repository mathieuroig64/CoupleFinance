//
//  UIView+XIBLoading.h
//  Citer
//
//  Created by Mathieu ROIG on 02/09/10.
//  Copyright 2010 Appsolutely Media. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView(XIBLoading)
+(id)loadXIB:(NSString*)nibName forClass:(Class)classType;
@end
