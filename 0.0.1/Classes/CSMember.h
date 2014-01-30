//
//  CSMember.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSLocation.h"
#import "CSLanguageItem.h"
#import "CSMemberCouchInfo.h"
#import "CSMemberPersonalInfo.h"


@interface CSMember : NSObject { // this is a profileObject
	NSString *memberId;
	NSString *memberName;
	CSLocation *homeLocation;    // ICBM, city, country
	CSLocation *currentLocation;
	
	NSString *profileName;
	NSString *currentMission;
	NSString *imageURL;
	NSDate   *lastLogin;
	NSDate   *memberSince;
	NSDate   *birthDay;
	
	int profileViews;
	
	int gender; //CSkGender gender;
	int onlineStatus; //CSkOnlineStatus onlineStatus;
	int couchAvailability; //CSkCouchAvailability couchAvailability; 
	int ambassadorStatus; //CSkAmbassadorStatus  ambassadorStatus;
	int verificationLevel; //CSkVerificationLevel verificationLevel;
	int communityDesignations; // CSkCommunityDesignations communityDesignations;
	int contributionStatus; //CSkContributionStatus contributionStatus;
	
	NSArray *vouches; // array of userIds
	
	NSString *occupation;	
	NSString *education;
	NSString *grewUpIn;
	NSString *ethnicity;
	NSString *webSite;
	
	NSDictionary *contactInfoRestricted; // skype, msn (whatever we can get from page)
	
	NSArray *languages; // CSLanguageItem (language, level)
	
	NSArray *groups; // CSGroup
	
	CSMemberCouchInfo *couchInfo;
	NSArray *friends; // CSConnection contains memberName, daysSurfed, daysHosted, etc.
	
	NSArray *photoLinks;
	
	CSMemberPersonalInfo *personalInfo; // description, etc.
	NSArray *references; // CSConnections (has CSReference)
	
}

@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, copy) NSString *memberName;
@property (nonatomic, copy) NSString *profileName;
@property (nonatomic, retain) CSLocation *homeLocation;

@end
