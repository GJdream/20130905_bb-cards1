//
//  FirstViewController.h
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright Kishikawa Katsumi 2010. All rights reserved.
//

#import "FlipCardView.h"

@interface FirstViewController : UIViewController {
    FlipCardView *thumbnailView;
    NSMutableArray *mainmenu;
    NSMutableArray *menuitemArr;
    NSMutableArray *passitems0;
    NSMutableArray *passitems1;
    NSMutableArray *passitems2;
    NSMutableArray *passitems3;
    NSMutableArray *passitems4;
    NSMutableArray *passitems5;
    NSMutableArray *passitems6;
    NSMutableArray *passitems7;
    NSMutableArray *passitems8;
    NSMutableArray *passitems9;
    NSMutableArray *passitems10;
    NSMutableArray *passitems11;
    NSMutableArray *passsounditems0;
    UINavigationBar *navigationBar;
    UIViewController *previousViewController;
    UIBarButtonItem *anotherButton;
    BOOL toggleInfoIcon;
    UIView *infoView;
}
@property (nonatomic, assign) NSMutableArray *menuitemArr;
@property (nonatomic, assign) NSMutableArray *passitems0;
@property (nonatomic, assign) NSMutableArray *passitems1;
@property (nonatomic, assign) UINavigationBar *navigationBar;
@property (nonatomic, assign) UIViewController *previousViewController;
@property (nonatomic, assign) UIBarButtonItem *anotherButton;


@end
