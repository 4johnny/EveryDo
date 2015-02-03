//
//  DetailViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"


#
# pragma mark - Interface
#


@interface DetailViewController ()

@end


#
# pragma mark - Implementation
#


@implementation DetailViewController


#
# pragma mark Accessors
#


- (void)setTodo:(Todo*)todo {
	
	if (_todo == todo) return;
	
	_todo = todo;
	[self configureView];
}


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	
	[self configureView];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
	// Dispose of any resources that can be recreated.
	
}


#
# pragma mark Action Handlers
#


- (IBAction)defaultPressed:(UIBarButtonItem *)sender {
	
	// Archive existing todo as user default for new todos
	NSData* defaultTodoData = [NSKeyedArchiver archivedDataWithRootObject:(Todo*)self.todo];
	[[NSUserDefaults standardUserDefaults] setObject:defaultTodoData forKey:TODO_DEFAULT_KEY];
}


#
# pragma mark Helpers
#


- (void)configureView {
	// Update the user interface for the todo.
	
	if (!self.todo) return;

	self.titleLabel.text = self.todo.titleText;
	self.descriptionLabel.text = self.todo.descriptionText;
	self.priorityLabel.text = [NSString stringWithFormat:@"%d", self.todo.priorityNumber];
	self.completedLabel.text = self.todo.isCompleted ? @"YES" : @"NO";
}


@end
