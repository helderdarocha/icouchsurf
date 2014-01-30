//
//  CSMessageTableViewCell.m
//  iCouchSurf
//
//  Created by Helder da Rocha on 11/3/08.
//  Copyright 2008 Argo Navis. All rights reserved.
//

#import "CSMessageTableViewCell.h"

#define TEXT_COLUMN_OFFSET		35
#define DATE_COLUMN_OFFSET		205
#define TEXT_COLUMN_WIDTH		170
#define DATE_COLUMN_WIDTH		85
#define UPPER_ROW_TOP			0
#define CELL_HEIGHT				50


@implementation CSMessageTableViewCell

@synthesize subjectLabel;
//@synthesize messageFragmentLabel;
@synthesize dateLabel;
@synthesize senderLabel;
@synthesize senderPhoto;

@synthesize read;
@synthesize isCS;

- (void) setupData: (CSMessage *) message {
	self.senderLabel.text = message.sender.memberName;
	self.subjectLabel.text = message.subject;
	//self.messageFragmentLabel.text = message.messageTruncated;
	self.dateLabel.text = @"[date/time]"; //[NSString stringWithFormat: @"%@", [Utilities formatDate: item.creationDate]];
	self.read = NO; //message.read;
}

- (id)initWithFrame:(CGRect)aRect reuseIdentifier:(NSString *)identifier
{
	self = [super initWithFrame:aRect reuseIdentifier:identifier];
	if (self)
	{
		// you can do this here specifically or at the table level for all cells
		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		self.senderLabel = [[UILabel alloc] initWithFrame:CGRectZero];	// layoutSubViews will decide the final frame
		self.senderLabel.backgroundColor = [UIColor clearColor];
		self.senderLabel.opaque = NO;
		self.senderLabel.textColor = [UIColor blackColor];
		self.senderLabel.highlightedTextColor = [UIColor whiteColor];
		self.senderLabel.font = [UIFont boldSystemFontOfSize:13];
		[self.contentView addSubview:self.senderLabel]; 
		
		self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];	// layoutSubViews will decide the final frame
		self.dateLabel.backgroundColor = [UIColor clearColor];
		self.dateLabel.opaque = NO;
		self.dateLabel.textColor = [UIColor blueColor];
		self.dateLabel.highlightedTextColor = [UIColor whiteColor];
		self.dateLabel.font = [UIFont systemFontOfSize:10];
		self.dateLabel.textAlignment = UITextAlignmentCenter;
		[self.contentView addSubview:self.dateLabel];
		
		self.subjectLabel = [[UILabel alloc] initWithFrame:CGRectZero];	// layoutSubViews will decide the final frame
		self.subjectLabel.backgroundColor = [UIColor clearColor];
		self.subjectLabel.opaque = NO;
		self.subjectLabel.textColor = [UIColor darkGrayColor];
		self.subjectLabel.highlightedTextColor = [UIColor whiteColor];
		self.subjectLabel.font = [UIFont systemFontOfSize:12];
		[self.contentView addSubview:self.subjectLabel];
	}
	
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
    CGRect contentRect = [self.contentView bounds];
	
	CGRect frame = CGRectMake(contentRect.origin.x + TEXT_COLUMN_OFFSET, UPPER_ROW_TOP - 7, TEXT_COLUMN_WIDTH, CELL_HEIGHT - 10);
	self.senderLabel.frame = frame;
	
	frame = CGRectMake(contentRect.origin.x + DATE_COLUMN_OFFSET, UPPER_ROW_TOP + 4, DATE_COLUMN_WIDTH, CELL_HEIGHT / 2 - 10);
	self.dateLabel.frame = frame;
	
	frame = CGRectMake(contentRect.origin.x + TEXT_COLUMN_OFFSET, UPPER_ROW_TOP + 10, TEXT_COLUMN_WIDTH+DATE_COLUMN_WIDTH, CELL_HEIGHT - 10);
	self.subjectLabel.frame = frame;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[subjectLabel release];
	//[messageFragmentLabel release];
	[dateLabel release];
	[senderLabel release];
	[senderPhoto release];
    [super dealloc];
}


@end
