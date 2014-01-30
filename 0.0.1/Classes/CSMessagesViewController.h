//
//  CSMessagesViewController.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 10/25/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CSMessagesViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	NSArray *messages;
	NSArray *messageViewList; // of CSMessageView
	IBOutlet UITableView *messagesTableView;
}

@property (nonatomic, retain) NSArray *messages;
@property (nonatomic, retain) UITableView *messagesTableView;

- (void) refresh;

@end
