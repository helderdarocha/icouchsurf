//
//  CSMessage.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSMember.h"
#import "CSGroup.h"


@interface CSMessage : NSObject {
	NSString *messageId;
	NSString *messageTruncated;
	NSString *messageContents;
	CSMember *sender;
	CSMember *receiver;
	CSGroup *group;
	NSDate *dateSent;
	NSDate *dateReplied;
	NSString *subject;
}

@property (nonatomic, copy) NSString *messageId;
@property (nonatomic, copy) NSString *messageTruncated;
@property (nonatomic, copy) NSString *messageContents;
@property (nonatomic, retain) CSMember *sender;
@property (nonatomic, retain) CSMember *receiver;
@property (nonatomic, retain) CSGroup *group;
@property (nonatomic, retain) NSDate *dateSent;
@property (nonatomic, retain) NSDate *dateReplied;
@property (nonatomic, copy) NSString *subject;

@end
