//
//  CSLoginViewController.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/26/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CSMessage.h"
#import "CSMember.h"
#import "CSLocation.h"
#import "CSMessagesViewController.h"

#define kCSMessagesPage @"http://www.couchsurfing.com/messages.html"

@interface CSLoginViewController : UIViewController<UITextFieldDelegate> {
	NSString *userName;
	NSString *password;
	
	IBOutlet UITextField *userNameField;
	IBOutlet UITextField *passwordField;
	
	IBOutlet UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	
	IBOutlet CSMessagesViewController *messagesViewController;
}

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, retain) UITextField *userNameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) CSMessagesViewController *messagesViewController;

- (IBAction) login;

@end
