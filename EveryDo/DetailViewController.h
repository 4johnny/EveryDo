//
//  DetailViewController.h
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"


#
# pragma mark - Interface
#

@interface DetailViewController : UIViewController

#
# pragma mark Properties
#

@property (strong, nonatomic) Todo* todo;

#
# pragma mark Outlets
#

@property (weak, nonatomic) IBOutlet UIBarButtonItem *defaultBarButtonItem;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedLabel;

@end

