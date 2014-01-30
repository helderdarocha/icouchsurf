//
//  CSMember.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSMember.h"


@implementation CSMember

@synthesize memberId;
@synthesize profileName;
@synthesize memberName;
@synthesize homeLocation;

- (void) dealloc {
	[memberName release];
	[profileName release];
	[memberId release];
	[homeLocation release];
	[super dealloc];
}

@end
