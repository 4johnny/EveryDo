//
//  MasterViewController.h
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTodoViewController.h"

@class DetailViewController;


#
# pragma mark - Interface
#

@interface MasterViewController : UITableViewController <UITableViewDataSource, AddTodoViewControllerDelegate>

#
# pragma mark Properties
#

@property NSMutableArray *todos;

@property (strong, nonatomic) DetailViewController *detailViewController;

#
# pragma mark Outlets
#

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *itemSwipeGestureRecognizer;

@end

