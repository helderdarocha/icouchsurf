//
//  CSLoginViewController.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/26/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSLoginViewController.h"


@implementation CSLoginViewController

@synthesize userName;
@synthesize password;
@synthesize userNameField;
@synthesize passwordField;
@synthesize window;
@synthesize tabBarController;
@synthesize messagesViewController;

- (void)viewDidLoad {
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if (theTextField == passwordField) {
		[passwordField resignFirstResponder];
        self.password = passwordField.text;
	}
	if (theTextField == userNameField) {
		[userNameField resignFirstResponder];
        self.userName = userNameField.text;
	}
	return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Dismiss the keyboard when the view outside the text field is touched.
    [passwordField resignFirstResponder];
	[userNameField resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction) login {
	[passwordField resignFirstResponder];
	self.password = passwordField.text;
	[userNameField resignFirstResponder];
	self.userName = userNameField.text;

	NSString *requestString = [NSString stringWithFormat:@"&auth_login[un]=%@&auth_login[pw]=%@", userName, password];
	NSLog(@"Request string: %@", requestString);
	NSData *requestData = [NSData dataWithBytes:[requestString UTF8String] length:[requestString length]];
	//NSLog(@"Request data: %@", requestData);
	NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:kCSMessagesPage]]; 
	//NSLog(@"URL request: %@", urlRequest);
	[urlRequest setHTTPMethod: @"POST" ];
	[urlRequest setHTTPBody: requestData];
	
	NSURLResponse *response;
	NSError *error;
	
	NSData *returnData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
	NSLog(@"Response: %@", response);
	//NSLog(@"Error: %@", error);
	
	//NSString *dataStr  = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	//NSLog(@"Response: %@", dataStr);
	
	// ignoring just to test - THIS IS TEST CODE
	NSString *dataStr = [NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://www.couchsurfing.com/messages.html?&auth_login[un]=clearsky&auth_login[pw]=argo77"]];
	///////
	
	//NSLog(@"Response: %@", dataStr);
	
	if ([dataStr rangeOfString:@"<title>CouchSurfing - My Inbox</title>"].location != NSNotFound) {
		NSLog(@"Is message page!");
		
		// remove this login view
		[[[window subviews] objectAtIndex:0] removeFromSuperview];
		
		// split
		NSArray *tokens = [dataStr componentsSeparatedByString:@"<a href='profile.html?id="];
		
		//NSLog(@"Tokens: %@", tokens);
		
		NSMutableArray *messages = [[NSMutableArray alloc] init]; // messages array
		
		// throw away 0 and treat last after loop
		for (int i = 1; i < [tokens count] - 1; i++) { // RISKY CODE - may lose last message if HTML changes!
			CSMessage *message = [[CSMessage alloc] init];
			NSString *messageString = [[tokens objectAtIndex:i] retain];
			// before ' we have ID
			CSMember *member = [[CSMember alloc] init];
			member.memberId = [messageString substringToIndex:[messageString rangeOfString:@"'"].location];
			NSLog(@"Found id: %@", member.memberId);
			
			// skip >, we have name until next <
			int start = [messageString rangeOfString:@"'>"].location + 2;
			int end   = [messageString rangeOfString:@"<"].location;
			member.memberName = [messageString substringWithRange:NSMakeRange(start, end - start)];
			NSLog(@"Found memberName: %@", member.memberName);
			
			// find <em> we have couhtry, until <
			start = [messageString rangeOfString:@"<em>"].location + 4;
			end   = [messageString rangeOfString:@"</em>"].location;
			CSLocation *location = [[CSLocation alloc] init];
			location.country = [messageString substringWithRange:NSMakeRange(start, end - start)];
			NSLog(@"Found country: %@", location.country);
			
			// throw away all until messages.html?read=
			start = [messageString rangeOfString:@"&read="].location + [@"&read=" length];
			NSLog(@"Length %i", [messageString length]);
			NSLog(@"Start %i", start);
			NSString *messageId = [messageString substringWithRange:NSMakeRange(start, [messageString length] - start)];
			NSLog(@"messageId %@", messageId);
			end   = [messageId rangeOfString:@"'>"].location;
			NSLog(@"End %i", end);
			message.messageId = [messageId substringWithRange:NSMakeRange(start, start + end)];
			NSLog(@"Found messageId: %@", message.messageId);
			
			// Find >
			start = start + end + 2;
			NSString *subject = [messageString substringWithRange:NSMakeRange(start, [messageString length] - start)];
			end = [subject rangeOfString:@"</a>"].location;
			message.subject = [subject substringToIndex:end];
			NSLog(@"Found subject: %@", message.subject);
			
			member.homeLocation = location;
			message.sender = member;
			
			// 1st numbering date
			//start = [messageString rangeOfString:@"<div class='numbering'>"].location + [@"<div class='numbering'>" length];
			//end   = [messageString rangeOfString:@"</td>"].location;
			//NSString *dateAndTime = [messageString substringWithRange:NSMakeRange(start, end - start)];
			// TODO - get this string and parse date and time to make NSDate
			
			// 2nd numbering date
			// TODO
			
			// add message to array
			[messages addObject:message];
			NSLog(@"Added: %@, total = %i", message, [messages count]);
			
			[message release];
			[messageString release];
			[member release];
			[location release];
		}
		// ignore last - show only some messages in this version!
		//messagesViewController = [[CSMessagesViewController alloc] initWithNibName:@"MessagesView" bundle:[NSBundle mainBundle]];
		// save messages array in messages controller for display
		messagesViewController.messages = [messages copy];
		[messages release];
		
		//NSLog(@"Messages: %@", messagesViewController.messages);

		// display view controller
		[window addSubview:tabBarController.view];
		[window makeKeyAndVisible];
		[messagesViewController refresh];
		
	} else if ([dataStr rangeOfString:@"<h1>Sorry, that username and password combination is not valid.</h1>"].location != NSNotFound) { // is login page - try again!!!
		NSLog(@"Is login page - it failed; display errors and try again!");
	} else {
		NSLog(@"No idea... probably an error.");
	}
	
	[urlRequest release];
	//[dataStr release];
	
	
}

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[userName release];
	[password release];
	[userNameField release];
	[passwordField release];
	[messagesViewController release];
	[window release];
	[tabBarController release];
    [super dealloc];
}


@end
