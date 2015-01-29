//
//  AddTodoViewController.h
//  EveryDo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddTodoViewController;
@class Todo;

// TODO: Consider using an "unwind segue" instead of overhead of delegate protocol.
@protocol AddTodoViewControllerDelegate <NSObject>

- (void)addTodoViewControllerDidCancel:(AddTodoViewController *)controller;
- (void)addTodoViewController:(AddTodoViewController *)controller didAddTodo:(Todo*)todo;

@end


@interface AddTodoViewController : UITableViewController

@property (nonatomic, weak) id <AddTodoViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;


@end
