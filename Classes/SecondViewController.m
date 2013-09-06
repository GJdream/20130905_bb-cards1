//
//  SecondViewController.m
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright 2010 Kishikawa Katsumi. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ExampleAppDataObject.h"
#import "AppDelegateProtocol.h"

@implementation SecondViewController

@synthesize navigationBar;
@synthesize previousViewController;
@synthesize items2;
@synthesize isSomethingEnabled;
@synthesize theAudio;


- (ExampleAppDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	ExampleAppDataObject* theDataObject;
	theDataObject = (ExampleAppDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}


- (void)dealloc {
    [theAudio release];
    [super dealloc];
}

- (void)loadpassitems:(NSMutableArray* )passitem
{
    //NSLog(@"at SecondViewController loadpassitems:%s",passitem);
    items2 = passitem;
    /* if ([items2 objectAtIndex:0] != nil) {
     //NSString *passitem2 = @"passitem";
     NSLog(@"at SecondViewController loadpassitems:%@",items2);
     NSLog(@"at SecondViewController flipCardView items object 1:%@",[items2 objectAtIndex:0]);
     }*/
}




- (void)loadView {
    NSLog(@"at SecondViewController loadownView");
    
    //NSLog(@"at SecondViewController loadownView:%s",isSomethingEnabled);
    //NSLog(@"at SecondViewController loadpassitems:%@",[items2 objectAtIndex:0]);
	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 414.0f)];
    contentView.backgroundColor = [UIColor grayColor];
	self.view = contentView;
	//[contentView release];
    
	thumbnailView = [[FlipCardView alloc] initWithFrame:contentView.frame];
	thumbnailView.delegate = self;
	thumbnailView.dataSource = self;
	[contentView addSubview:thumbnailView];
	[thumbnailView release];
    
    playsound = NO;
    UIButton * playsoundBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playsoundBtn.frame = CGRectMake(110, 365, 100, 40);
    [playsoundBtn setTitle:@"sound" forState:UIControlStateNormal];
    //playsoundBtn.tag = row * [self flipCardViewNumberOfColumns:flipCardView] + column;
    [playsoundBtn addTarget:self action:@selector(clicktoEditProfile:) forControlEvents:UIControlEventTouchUpInside];
    
    [thumbnailView addSubview:playsoundBtn];
}



- (void)viewDidLoad {    
}


- (void)viewDidUnLoad {
    [theAudio release];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark FlipCardViewDataSource Methods

- (NSUInteger)flipCardViewNumberOfRows:(FlipCardView *)flipCardView {
    return 1;
}

- (NSUInteger)flipCardViewNumberOfColumns:(FlipCardView *)flipCardView {
    return 8;
}

- (UIView *)flipCardView:(FlipCardView *)flipCardView thumbnailViewForRow:(NSUInteger)row forColumn:(NSUInteger)column {
    ExampleAppDataObject* theDataObject = [self theAppDataObject];
    
    UIView *flipCardcontentView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 414.0f)];
    
    UIImageView* labelimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 360.0f)];
    labelimage1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[theDataObject.passitems objectAtIndex:row * [self flipCardViewNumberOfColumns:flipCardView] + column]]];
    
    [flipCardcontentView addSubview:labelimage1];
    
 
    return [flipCardcontentView autorelease];

    
    /*UIButton* playsoundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playsoundBtn.titleLabel.text = @"sound";
    //playsoundBtn.frame = CGRectMake(0.0f, 0.0f,80,15);
    playsoundBtn.frame = CGRectMake(0.0f, 0.0f, 320.0f, 320.0f);
    playsoundBtn.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    playsoundBtn.tag = row * [self flipCardViewNumberOfColumns:flipCardView] + column;
    [playsoundBtn addTarget:self action:@selector(clicktoEditProfile:) forControlEvents:UIControlEventTouchUpInside];*/
}

-(void)clicktoEditProfile: (id)sender {
    NSLog(@"at SecondViewController clicktoEditProfile");
     
    if (playsound == NO) {
        playsound = YES;
    } else {
        if (self.theAudio != nil) {
            [self.theAudio stop];
        }
        playsound = NO;
    }

}


#pragma mark FlipCardViewDelegate Methods

- (CGFloat)flipCardView:(FlipCardView *)flipCardView heightForRow:(NSUInteger)row {
    return 414.0f;
}

- (CGFloat)flipCardView:(FlipCardView *)flipCardView widthForColumn:(NSUInteger)column {
    return 320.0f;
}

- (void)flipCardView:(FlipCardView *)flipCardView didSelectThumbnailForRow:(NSUInteger)row forColumn:(NSUInteger)column {
    NSLog(@"at flipCardView didSelectThumbnailForRow");
    

    /*ExampleAppDataObject* theDataObject = [self theAppDataObject];
    theDataObject.passPhotoInThirdVC = [theDataObject.passitems objectAtIndex:row * [self flipCardViewNumberOfColumns:flipCardView] + column];
    
    ThirdViewController *controller = [[ThirdViewController alloc] init];
    [thumbnailView pushViewController:controller];
    navigationBar.delegate = self;
    controller.navigationBar = navigationBar;
    [controller release];
    
    [navigationBar pushNavigationItem:controller.navigationItem animated:YES];*/
    if (playsound == YES) {
        if (self.theAudio != nil) {
            [self.theAudio stop];
        }
    }
    ExampleAppDataObject* theDataObject = [self theAppDataObject];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[theDataObject.passSounditems objectAtIndex:row * [self flipCardViewNumberOfColumns:flipCardView] + column]ofType:@"mp3"];
    theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    self.theAudio.delegate=self;
    [self.theAudio play];
    playsound = YES;
}

- (BOOL)navigationBar:(UINavigationBar *)navBar shouldPopItem:(UINavigationItem *)item {
    if (self.theAudio != nil) {
        [self.theAudio stop];
    }
    [thumbnailView popViewController];
    navigationBar.delegate = previousViewController;
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"at SecondViewController touchesBegan");
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleSingleTap) object:nil];
    
    if ([[event touchesForView:self.view] count] > 1) {
        multipleTouches = YES;
    }
    if ([[event touchesForView:self.view] count] > 2) {
        twoFingerTapIsPossible = NO;
    }
}


@end
