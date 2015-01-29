//
//  Todo.h
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString* titleText;
@property (nonatomic) NSString* descriptionText;
@property (nonatomic) int priorityNumber;
@property (nonatomic, getter=isCompleted) BOOL completed;

+ (Todo*)todoWithTitle:(NSString*) title andDescription:(NSString*) description andPriorityNumber:(int)priorityNumber andCompleted:(BOOL)completed;

@end
