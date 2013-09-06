//
//  FlipCardNavigationViewAppDelegate.h
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright Kishikawa Katsumi 2010. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegateProtocol.h"

@class ExampleAppDataObject;

@interface FlipCardNavigationViewAppDelegate : NSObject <UIApplicationDelegate, AppDelegateProtocol> {
    UIWindow *window;
    UINavigationController *navigationController;
    ExampleAppDataObject* theAppDataObject;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) ExampleAppDataObject* theAppDataObject;

-(void)secondViewControllerreceiveData: (NSNotification *) notification;
@end

