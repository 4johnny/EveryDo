//
//  Todo.h
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


#
# pragma mark - Constants
#


#define TODO_DEFAULT_KEY @"todoDefault"


#
# pragma mark - Interface
#

@interface Todo : NSObject <NSCoding>

#
# pragma mark Properties
#

@property (nonatomic) NSString* titleText;
@property (nonatomic) NSString* descriptionText;
@property (nonatomic) int priorityNumber;
@property (nonatomic, getter=isCompleted) BOOL completed;

#
# pragma mark Initialization
#

+ (Todo*)todoWithTitle:(NSString*) title andDescription:(NSString*) description andPriorityNumber:(int)priorityNumber andCompleted:(BOOL)completed;

@end
