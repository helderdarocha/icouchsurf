//
//  CSLocation.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSLocation.h"


@implementation CSLocation

@synthesize country;

- (void) dealloc {
	[country release];
	[super dealloc];
}

@end
