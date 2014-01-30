//
//  CSMessagesViewController.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSMessagesViewController.h"
#import "CSMessage.h"
#import "CSMessageTableViewCell.h"


@implementation CSMessagesViewController

@synthesize messages;
@synthesize messagesTableView;


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		NSLog(@"Did initialize MessagesViewController");
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Only one section
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSLog(@"Rows: %i", [messages count]);
	return [messages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	CSMessageTableViewCell *cell = (CSMessageTableViewCell *) [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[CSMessageTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
	

	
	// Configure the cell
	CSMessage *message = [self.messages objectAtIndex: indexPath.row];
	[cell setupData: message];
	return cell;
}

/*
 To conform to Human Interface Guildelines, since selecting a row would have no effect (such as navigation), make sure that rows cannot be selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	CSMessage *message = [messages objectAtIndex:indexPath.row];
	
	NSLog(@"I selected message no.", message.messageId);
	
	//message.read = TRUE; // message was read
	/*
	 CSMessageViewController *messageViewController = [CSMessageViewController alloc];
	 [messageViewController initWithNibName: @"MessageView" bundle: [NSBundle mainBundle]];
	 messageViewController.message = message;
	 
	 // Push the detail view controller
	 [[self navigationController] pushViewController:messageViewController animated:YES];
	 [messageViewController release];
	 */
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self tableView:_tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
	//NSLog(@"Messages: %@", messages);
}

- (void) refresh {
	NSLog(@"Messages: %@", messages);
	[messagesTableView reloadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[messages release];
	[messagesTableView release];
    [super dealloc];
}


@end
