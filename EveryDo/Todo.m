//
//  Todo.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "Todo.h"

@implementation Todo


- (instancetype)initWithTitle:(NSString*) title andDescription:(NSString*)description andPriorityNumber:(int)priorityNumber andCompleted:(BOOL)completed {
	
	self = [super init];
	if (self) {
		
		_titleText = title;
		_descriptionText = description;
		_priorityNumber = priorityNumber;
		_completed = completed;
	}
	
	return self;
}


- (instancetype)init {
	return [self initWithTitle:nil andDescription:nil andPriorityNumber:-1 andCompleted:NO];
}


+ (Todo*)todoWithTitle:(NSString*) title andDescription:(NSString*) description andPriorityNumber:(int)priorityNumber andCompleted:(BOOL)completed {
	
	return [[Todo alloc] initWithTitle:title andDescription:description andPriorityNumber:priorityNumber andCompleted:completed];
}


@end
