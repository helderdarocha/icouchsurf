//
//  CSMessageTableViewCell.h
//  iCouchSurf
//
//  Created by Helder da Rocha on 11/3/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSMessage.h"


@interface CSMessageTableViewCell : UITableViewCell {
	UILabel	*subjectLabel;
	//UILabel	*messageFragmentLabel;
	UILabel	*dateLabel;
	UILabel *senderLabel;
	UIImageView *senderPhoto;
	
	BOOL read;
	BOOL isCS;
}

@property (nonatomic, retain) UILabel	*subjectLabel;
//@property (nonatomic, retain) UILabel	*messageFragmentLabel;
@property (nonatomic, retain) UILabel	*dateLabel;
@property (nonatomic, retain) UILabel *senderLabel;
@property (nonatomic, retain) UIImageView *senderPhoto;
@property (nonatomic) BOOL read;
@property (nonatomic) BOOL isCS;

- (void) setupData: (CSMessage *) message;

@end
