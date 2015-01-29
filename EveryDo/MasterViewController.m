//
//  MasterViewController.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"


@interface MasterViewController ()

@end


@implementation MasterViewController


- (void)awakeFromNib {
	[super awakeFromNib];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		self.clearsSelectionOnViewWillAppear = NO;
		self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
	//	if (!self.todos) {
	//		self.todos = [[NSMutableArray alloc] init];
	//	}
	//	[self.todos insertObject:[NSDate date] atIndex:0];
	//	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	//	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#
# pragma mark - Segues
#


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
		
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		Todo* todo = self.todos[indexPath.row];
		DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
		[controller setDetailItem:todo];
		controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
		controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}


#
# pragma mark - Table View
#


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.todos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
	
	Todo* todo = self.todos[indexPath.row];
	
	// Populate custom Todo table cell
	UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
	titleLabel.attributedText = [MasterViewController string:todo.titleText withStrikethrough:todo.isCompleted];
 
	UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:101];
	descriptionLabel.attributedText = [MasterViewController string:todo.descriptionText withStrikethrough:todo.isCompleted];
	descriptionLabel.font = [descriptionLabel.font fontWithSize:descriptionLabel.font.pointSize - 3];
	
	UILabel *priorityLabel = (UILabel *)[cell viewWithTag:102];
	priorityLabel.text = [NSString stringWithFormat:@"%d", todo.priorityNumber];
	
	//	// Standard cell
	//	cell.textLabel.text = todo.titleText;
	//	cell.detailTextLabel.text = todo.descriptionText;
	
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
# pragma mark - Helpers
#


+ (NSAttributedString*)string:(NSString*)string withStrikethrough:(BOOL)strikethrough {
	
	return [[NSAttributedString alloc] initWithString:string
										   attributes:strikethrough ? @{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)} : @{}];
}


@end
