//
//  CSMessage.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSMessage.h"


@implementation CSMessage

@synthesize messageId;
@synthesize messageTruncated;
@synthesize messageContents;
@synthesize sender;
@synthesize receiver;
@synthesize group;
@synthesize dateSent;
@synthesize dateReplied;
@synthesize subject;

- (NSString *) description {
	return [NSString stringWithFormat:@"Message %@ from %@ with subject %@", messageId, sender, subject];
}

- (void) dealloc {
	[messageId release];
	[messageTruncated release];
	[messageContents release];
	[sender release];
	[receiver release];
	[group release];
	[dateSent release];
	[dateReplied release];
	[subject release];
	[super dealloc];
}

@end
