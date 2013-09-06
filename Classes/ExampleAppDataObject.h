//
//  ExampleAppDataObject.h
//  ViewControllerDataSharing
//
//  Created by Duncan Champney on 7/29/10.

#import <Foundation/Foundation.h>
#import "AppDataObject.h"


@interface ExampleAppDataObject : AppDataObject
{
	NSString*	passPhotoInThirdVC;
	NSData*		data1;
	NSInteger	int1;
    NSMutableArray *passitems;
    NSMutableArray *passSounditems;
}

@property (nonatomic, copy) NSString* passPhotoInThirdVC;
//@property (nonatomic, copy) NSData* data1;
@property (nonatomic, retain) NSData* data1;
@property (nonatomic) NSInteger int1;
@property (nonatomic, retain) NSMutableArray *passitems;
@property (nonatomic, retain) NSMutableArray *passSounditems;
@property (nonatomic) CGFloat	float1;

@end
