//
//  ExampleAppDataObject.m
//  ViewControllerDataSharing
//
//  Created by Duncan Champney on 7/29/10.

#import "ExampleAppDataObject.h"


@implementation ExampleAppDataObject
@synthesize passPhotoInThirdVC;
@synthesize data1;
@synthesize int1;
@synthesize float1;
@synthesize passitems;
@synthesize passSounditems;

#pragma mark -
#pragma mark -Memory management methods

- (void)dealloc
{
	//Release any properties declared as retain or copy.
	self.passPhotoInThirdVC = nil;
	self.data1 = nil;
    self.passitems = nil;
    self.passSounditems = nil;
	[super dealloc];
}
@end