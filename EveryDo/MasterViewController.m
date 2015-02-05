//
//  MasterViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddTodoViewController.h"
#import "TodoTableViewCell.h"
#import "Todo.h"


#
# pragma mark - Interface
#


@interface MasterViewController ()

@end


#
# pragma mark - Implementation
#


@implementation MasterViewController


#
# pragma mark NSObject(UINibLoadingAdditions)
#


- (void)awakeFromNib {
	[super awakeFromNib];
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		
		self.clearsSelectionOnViewWillAppear = NO;
		self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	//	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	//	self.navigationItem.rightBarButtonItem = addButton;
	
	//	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
	// Dispose of any resources that can be recreated.
	
}


#
# pragma mark Segues
#


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([segue.identifier isEqualToString:@"showDetail"]) {
		
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		Todo* todo = self.todos[indexPath.row];
		
		DetailViewController *controller = (DetailViewController *)[segue.destinationViewController topViewController];
		controller.todo = todo;
		controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
		controller.navigationItem.leftItemsSupplementBackButton = YES;
		
	} else if ([segue.identifier isEqualToString:@"addTodo"]) {
		
		AddTodoViewController* controller = (AddTodoViewController*)[segue.destinationViewController topViewController];
		controller.delegate = self;		
	}
}


#
# pragma mark <UITableViewDataSource>
#


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.todos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
	Todo* todo = self.todos[indexPath.row];

	cell.titleLabel.attributedText = [MasterViewController string:todo.titleText withStrikethrough:todo.isCompleted];
 
	cell.descriptionLabel.attributedText = [MasterViewController string:todo.descriptionText withStrikethrough:todo.isCompleted];
//	cell.descriptionLabel.font = [cell.descriptionLabel.font fontWithSize:cell.descriptionLabel.font.pointSize - 3];
	
	cell.priorityLabel.text = [NSString stringWithFormat:@"%d", todo.priorityNumber];

	return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		[self.todos removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}


#
# pragma mark <AddTodoViewControllerDelegate>
#


- (void)addTodoViewControllerDidCancel:(AddTodoViewController*)controller {

	// Dismiss modal "add" view
	[self dismissViewControllerAnimated:YES completion:nil];
	
	// Delete auto-save cache
	[NSFileManager.defaultManager removeItemAtPath:[AddTodoViewController getCacheFilePath] error:nil];
}


- (void)addTodoViewController:(AddTodoViewController*)controller didAddTodo:(Todo*)todo {

	// Dismiss modal "add" view
	[self dismissViewControllerAnimated:YES completion:nil];

	// Insert newly added todo item in data model
	if (!self.todos) {
		self.todos = [[NSMutableArray alloc] init];
	}
	[self.todos insertObject:todo atIndex:0];
	
	// Update table view
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	
	// Delete auto-save cache
	[NSFileManager.defaultManager removeItemAtPath:[AddTodoViewController getCacheFilePath] error:nil];
}


#
# pragma mark Action Handlers
#


- (IBAction)itemSwiped:(UISwipeGestureRecognizer*)sender {
	
	if (self.itemSwipeGestureRecognizer.state == UIGestureRecognizerStateRecognized) {

		CGPoint swipeLocation = [self.itemSwipeGestureRecognizer locationInView:self.tableView];
		NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
		Todo* todo = self.todos[indexPath.row];
		todo.completed = !todo.completed;
		[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}


#
# pragma mark Helpers
#


+ (NSAttributedString*)string:(NSString*)string withStrikethrough:(BOOL)strikethrough {
	
	return [[NSAttributedString alloc] initWithString:string
										   attributes:strikethrough ? @{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)} : @{}];
}


@end
