//
//  UIView+XIBLoading.m
//  Citer
//
//  Created by Mathieu ROIG on 02/09/10.
//  Copyright 2010 Appsolutely Media. All rights reserved.
//

#import "UIView+XIBLoading.h"


@implementation UIView(XIBLoading)
+(id)loadXIB:(NSString*)nibName forClass:(Class)classType{
	NSArray *nib=
	[[NSBundle mainBundle] loadNibNamed:nibName 
																owner:self 
															options:nil];
	for (id obj in nib) {
		if ([obj isKindOfClass:classType]) {
			return obj;
			break;
		}
	}
	return nil;
}
@end
