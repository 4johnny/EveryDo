//
//  AppDelegate.m
//  EveryDo
//
//  Created by Johnny on 2015-01-28.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"


@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic) NSMutableArray* todos;

@end


@implementation AppDelegate


- (void)loadModel {
	
	self.todos = [NSMutableArray arrayWithCapacity:5];
	
	[self.todos addObject:[Todo todoWithTitle:@"Do laundry" andDescription:@"Laundromat closes at 9pm" andPriorityNumber:1 andCompleted:NO]];
	
	[self.todos addObject:[Todo todoWithTitle:@"Get haircut" andDescription:@"Haircut with Julia" andPriorityNumber:3 andCompleted:YES]];

	[self.todos addObject:[Todo todoWithTitle:@"Mow lawn" andDescription:@"Mow front lawn today, also prune tree" andPriorityNumber:2 andCompleted:NO]];

	[self.todos addObject:[Todo todoWithTitle:@"Grocery shopping" andDescription:@"Don't forget bananas" andPriorityNumber:4 andCompleted:NO]];
	
	[self.todos addObject:[Todo todoWithTitle:@"Do homework" andDescription:@"Assignments 4 & 5" andPriorityNumber:4 andCompleted:YES]];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	// Set up split view controller.
	UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
	UINavigationController *secondaryNavigationController = [splitViewController.viewControllers lastObject];
	secondaryNavigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
	splitViewController.delegate = self;

	// Load model, and inject into master view controller.
	[self loadModel];
	UINavigationController *primaryNavigationController = [splitViewController.viewControllers firstObject];
	MasterViewController* masterViewController = primaryNavigationController.viewControllers[0];
	masterViewController.todos = self.todos;
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
