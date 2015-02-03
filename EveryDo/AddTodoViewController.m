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

	// Check if system crashed previously
	Todo* cachedTodo = [NSKeyedUnarchiver unarchiveObjectWithFile:[AddTodoViewController getCacheFilePath]];
	if (cachedTodo) {
		
		// Populate controls from auto-saved cache
		[self loadControlsFromTodo:cachedTodo];
		
	} else {
		
		// Populate controls with unarchived user default todo
		NSData* defaultTodoData = [[NSUserDefaults standardUserDefaults] objectForKey:TODO_DEFAULT_KEY];
		Todo* defaultTodo = [NSKeyedUnarchiver unarchiveObjectWithData:defaultTodoData];
		[self loadControlsFromTodo:defaultTodo];
	}
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
	
	[self.delegate addTodoViewController:self didAddTodo:[self todoFromControls]];
}


- (IBAction)textChanged {

	// Auto-save all fields in cache in case system crashes
	[NSKeyedArchiver archiveRootObject:[self todoFromControls] toFile:[AddTodoViewController getCacheFilePath]];
}


#
# pragma mark Helpers
#


- (void)loadControlsFromTodo:(Todo*)todo {

	self.titleTextField.text = todo.titleText;
	self.descriptionTextField.text = todo.descriptionText;
	self.priorityTextField.text = [NSString stringWithFormat:@"%d", todo.priorityNumber];
}


- (Todo*)todoFromControls {
	
	return [Todo todoWithTitle:self.titleTextField.text
				andDescription:self.descriptionTextField.text
			 andPriorityNumber:[[[NSNumberFormatter alloc] init] numberFromString:self.priorityTextField.text].intValue
				  andCompleted:NO];
}


+ (NSString*)getCacheFilePath {
	
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString* cachesDirectoryPath = paths.firstObject;
	
	return [cachesDirectoryPath stringByAppendingPathComponent:@"EveryDoAppDataCache"];
}


@end
