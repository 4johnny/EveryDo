//
//  AddTodoViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "AddTodoViewController.h"
#import "Todo.h"


@interface AddTodoViewController ()

@end


@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#
# pragma mark - Button action handlers
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


/*
#
# pragma mark - Navigation
#

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
