//
//  FlipCardNavigationViewAppDelegate.m
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright Kishikawa Katsumi 2010. All rights reserved.
//

#import "FlipCardNavigationViewAppDelegate.h"
#import "FirstViewController.h"
#import "AppDelegateProtocol.h"
#import "ExampleAppDataObject.h"

@implementation FlipCardNavigationViewAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize theAppDataObject;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(secondViewControllerreceiveData:)
												 name:@"secondViewControllerreceiveDataNotification"
											   object:nil];
}

-(void)secondViewControllerreceiveData: (NSNotification *) notification {
	NSLog(@"secondViewControllerreceiveData userInfo:%@",[notification userInfo]);
	if ([notification object] == @"homePage") {
    }
}

- (id) init
{
	self.theAppDataObject = [[ExampleAppDataObject alloc] init];
	[theAppDataObject release];
	return [super init];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
    self.theAppDataObject = nil;

	[super dealloc];
}

@end
