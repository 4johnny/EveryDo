//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "AddTodoViewController.h"
#import "Todo.h"


#
# pragma mark - Interface
#


@interface AddTodoViewController()

@end


#
# pragma mark - Implementation
#


@implementation AddTodoViewController


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

	// Populate fields with unarchived user default todo
	NSData* defaultTodoData = [[NSUserDefaults standardUserDefaults] objectForKey:TODO_DEFAULT_KEY];
	Todo* defaultTodo = [NSKeyedUnarchiver unarchiveObjectWithData:defaultTodoData];
	self.titleTextField.text = defaultTodo.titleText;
	self.descriptionTextField.text = defaultTodo.descriptionText;
	self.priorityTextField.text = [NSString stringWithFormat:@"%d", defaultTodo.priorityNumber];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
    // Dispose of any resources that can be recreated.
	
}


/*
 #
 # pragma mark Segues
 #

 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
	 // Get the new view controller using [segue destinationViewController].
	 // Pass the selected object to the new view controller.
 
 }
 */


#
# pragma mark Action Handlers
#


- (IBAction)cancelPressed:(id)sender {
	
	[self.delegate addTodoViewControllerDidCancel:self];
}


- (IBAction)donePressed:(id)sender {
	
	Todo* todo = [Todo todoWithTitle:self.titleTextField.text
					  andDescription:self.descriptionTextField.text
				   andPriorityNumber:[[[NSNumberFormatter alloc] init] numberFromString:self.priorityTextField.text].intValue
						andCompleted:NO];
	
	[self.delegate addTodoViewController:self didAddTodo:todo];
}


@end
