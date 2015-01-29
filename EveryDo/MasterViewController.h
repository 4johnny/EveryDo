//
//  MasterViewController.h
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource>

@property NSMutableArray *todos;

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

