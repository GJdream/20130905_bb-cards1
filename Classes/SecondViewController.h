//
//  SecondViewController.h
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright 2010 Kishikawa Katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<AVFoundation/AVAudioPlayer.h>
#import "FlipCardView.h"

@interface SecondViewController : UIViewController <AVAudioPlayerDelegate> {
    FlipCardView *thumbnailView;
    UINavigationBar *navigationBar;
    UIViewController *previousViewController;
    NSMutableArray *items2;
    AVAudioPlayer* theAudio;
    BOOL playsound;
    BOOL singleTapReady;
    CGPoint tapLocation;
    BOOL multipleTouches;
    BOOL twoFingerTapIsPossible;
}

@property (nonatomic, assign) UINavigationBar *navigationBar;
@property (nonatomic, assign) UIViewController *previousViewController;
@property (nonatomic, assign) NSMutableArray *items2;
@property (nonatomic, assign) BOOL *isSomethingEnabled;
@property (nonatomic, retain) AVAudioPlayer *theAudio;

- (void)loadpassitems:(NSMutableArray*)passitem;
-(void)secondViewControllerreceiveData: (NSNotification *) notification;
-(void)clicktoEditProfile: (id)sender;

@end
