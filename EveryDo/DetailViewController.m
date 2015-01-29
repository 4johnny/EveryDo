//
//  DetailViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"


@interface DetailViewController ()

@end


@implementation DetailViewController


#
# pragma mark - Managing the detail item
#


- (void)setDetailItem:(id)newDetailItem {
	
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}


- (void)configureView {
	// Update the user interface for the detail item.
	
	if (self.detailItem) {
		Todo* todo = (Todo*)self.detailItem;
		
		self.titleLabel.text = todo.titleText;
	    self.descriptionLabel.text = todo.descriptionText;
		self.priorityLabel.text = [NSString stringWithFormat:@"%d", todo.priorityNumber];
		self.completedLabel.text = todo.isCompleted ? @"YES" : @"NO";
	}
}


- (void)viewDidLoad {
	
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}


- (void)didReceiveMemoryWarning {
	
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
