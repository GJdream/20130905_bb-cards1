//
//  ThirdViewController.h
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/09.
//  Copyright 2010 Kishikawa Katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<AVFoundation/AVAudioPlayer.h>
#import "FlipCardView.h"

@interface ThirdViewController : UIViewController<AVAudioPlayerDelegate> {
    FlipCardView *thumbnailView;
    UINavigationBar *navigationBar;
    UIViewController *previousViewController;
    NSMutableArray *items3;

    BOOL singleTapReady;
    CGPoint tapLocation;
    BOOL multipleTouches;
    BOOL twoFingerTapIsPossible;
    AVAudioPlayer* theAudio;
}

@property (nonatomic, assign) UINavigationBar *navigationBar;
@property (nonatomic, assign) UIViewController *previousViewController;
@property (nonatomic, retain) AVAudioPlayer *theAudio;

@end
