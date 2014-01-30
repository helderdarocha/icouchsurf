//
//  iCouchSurfAppDelegate.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright Argo Navis 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSLoginViewController.h"
#import "CSMessagesViewController.h"

@interface iCouchSurfAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	CSLoginViewController *loginViewController;
	CSMessagesViewController *messagesViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet CSLoginViewController *loginViewController;
@property (nonatomic, retain) IBOutlet CSMessagesViewController *messagesViewController;

@end
