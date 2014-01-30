//
//  iCouchSurfAppDelegate.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright Argo Navis 2008. All rights reserved.
//

#import "iCouchSurfAppDelegate.h"
#import "CSLoginViewController.h"

#define kCSHomePath @"http://www.couchsurfing.com/home.html"
#define kCSMessagesPage @"http://www.couchsurfing.com/messages.html"

@implementation iCouchSurfAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize loginViewController;
@synthesize messagesViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	// try to load current home page: 
	NSLog(@"Getting website...");
	NSURL *url = [NSURL URLWithString: kCSMessagesPage];
	NSString *html = [NSString stringWithContentsOfURL:url];
	//NSLog(@"Got it! %@", html);
	
	// is this the login page?
	if([html rangeOfString:@"<title>CouchSurfing - Login</title>"].location != NSNotFound) { // if it is, show the login view
		// show login view
		NSLog(@"Is login");
		[window addSubview:[loginViewController view]];
		//NSLog(@"subviews: %@", [window subviews]);
		[window makeKeyAndVisible];
		[loginViewController release];
	} else {
		NSLog(@"Not login");
		[window addSubview:tabBarController.view];
	}
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
	[loginViewController release];
	[messagesViewController release];
    [window release];
    [super dealloc];
}

@end

