//
//  FirstViewController.m
//  FlipCardNavigationView
//
//  Created by Kishikawa Katsumi on 10/03/08.
//  Copyright Kishikawa Katsumi 2010. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ExampleAppDataObject.h"
#import "AppDelegateProtocol.h"
#import "ThirdViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FirstViewController
@synthesize menuitemArr,passitems0,passitems1;


- (ExampleAppDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	ExampleAppDataObject* theDataObject;
	theDataObject = (ExampleAppDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    toggleInfoIcon = false;
    
    anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(refreshPropertyList:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    [anotherButton release];
}

- (void)refreshPropertyList:(id)sender {
    NSLog(@"refreshPropertyList:");

    if (toggleInfoIcon == false) {
        /*ExampleAppDataObject* theDataObject = [self theAppDataObject];
        theDataObject.passPhotoInThirdVC = @"panorama";
        ThirdViewController *controller = [[ThirdViewController alloc] init];
        [thumbnailView pushViewController:controller];
        navigationBar.delegate = self;
        controller.navigationBar = navigationBar;

        [navigationBar pushNavigationItem:controller.navigationItem animated:YES];
        [ThirdViewController release];*/
        infoView.alpha = 0.8;
        toggleInfoIcon = true;
    } else {
        infoView.alpha = 0;
        toggleInfoIcon = false;
    }

}

- (void)bounceOutAnimationStoped
{
    NSLog(@"bounceOutAnimationStoped:");
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         infoView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6, 0.6);
         infoView.alpha = 0.8;
     }
                     completion:^(BOOL finished){
                         [self bounceInAnimationStoped];
                     }];
}
- (void)bounceInAnimationStoped
{
     NSLog(@"bounceInAnimationStoped:");
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         infoView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9, 0.9);
         infoView.alpha = 1.0;
     }
                     completion:^(BOOL finished){
                         [self animationStoped];
                     }];
}



- (void)loadView {
	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 414.0f)];
    contentView.backgroundColor = [UIColor grayColor];
	self.view = contentView;
	[contentView release];
    
	thumbnailView = [[FlipCardView alloc] initWithFrame:contentView.frame];
	thumbnailView.delegate = self;
	thumbnailView.dataSource = self;
	[contentView addSubview:thumbnailView];
	[thumbnailView release];
    
    self.title = @"card category";
    
    
    mainmenu = [NSMutableArray arrayWithObjects: @"card_father", @"1_mama",@"1_cat", @"1_ball",@"card_red", @"card_chair",@"card_toy1", @"card_clothes2",@"card_aeroplane", @"card_onion",@"card_cat", @"card_banana",nil];
    
    infoView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 414.0f)];
    infoView.backgroundColor = [UIColor whiteColor];
    infoView.layer.borderWidth = 5.0f;
    infoView.layer.borderColor = [[UIColor grayColor] CGColor];
    infoView.alpha = 0;
    [self.view addSubview:infoView];
    
    UILabel *label_title = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 600, 600)];
    //label_title.text = @"Developer: Agnes Lee \n \n email:idiscovereverything@gmail.com";
    //label_title.backgroundColor = [UIColor clearColor];
    //label_title.font = [UIFont systemFontOfSize:17.0];
    
    NSString *strContent = @"Developer: Agnes Lee \n \nemail:idiscovereverything@gmail.com \n \nThanks for downloading my apps.";
    
    CGSize labelStrSize = [strContent sizeWithFont:[UIFont systemFontOfSize:17.0] constrainedToSize:CGSizeMake(300, 99999.0) lineBreakMode:NSLineBreakByWordWrapping];
    label_title = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, labelStrSize.width, labelStrSize.height)];
    label_title.backgroundColor = [UIColor clearColor];
    label_title.font = [UIFont systemFontOfSize:17.0];
    label_title.text = strContent;
    
    label_title.numberOfLines = 0;

    [infoView addSubview:label_title];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark FlipCardViewDataSource Methods

- (NSUInteger)flipCardViewNumberOfRows:(FlipCardView *)flipCardView {
    return 4;
}

- (NSUInteger)flipCardViewNumberOfColumns:(FlipCardView *)flipCardView {
    return 3;
}

- (UIView *)flipCardView:(FlipCardView *)flipCardView thumbnailViewForRow:(NSUInteger)row forColumn:(NSUInteger)column {
    UIImageView *labelimage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 106.0f, 106.0f)];
	labelimage.tag = row * [self flipCardViewNumberOfColumns:flipCardView] + column;
    labelimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[mainmenu objectAtIndex:row * [self flipCardViewNumberOfColumns:flipCardView] + column]]];
    
    
    
    /*UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 106.0f, 106.0f)];
     label.backgroundColor = [UIColor whiteColor];
     label.text = [NSString stringWithFormat:@"%d", row * [self flipCardViewNumberOfColumns:flipCardView] + column];
     label.textAlignment = UITextAlignmentCenter;
     label.font = [UIFont boldSystemFontOfSize:24.0f];*/
    
	return [labelimage autorelease];
}

#pragma mark FlipCardViewDelegate Methods


- (CGFloat)flipCardView:(FlipCardView *)flipCardView heightForRow:(NSUInteger)row {
    return 106.0f;
}

- (CGFloat)flipCardView:(FlipCardView *)flipCardView widthForColumn:(NSUInteger)column {
    return 106.0f;
}

- (void)flipCardView:(FlipCardView *)flipCardView didSelectThumbnailForRow:(NSUInteger)row forColumn:(NSUInteger)column {
    passitems0 = [NSMutableArray arrayWithObjects: @"card_father.png", @"card_mother.png",@"card_grandmother.png", @"card_baby.png",@"card_grandfather.png", @"card_uncle.png",@"father.jpg", @"baby.jpg",nil];
    
    passitems1  = [NSMutableArray arrayWithObjects: @"1_mama.png", @"1_papa.png",@"3_brother.png",@"3_sister.png",@"6_uncle.png",@"7_boy.png",@"7_girl.png",@"8_friend1.png",@"8_friend2.png",nil];
    
    passitems2  = [NSMutableArray arrayWithObjects: @"1_cat.png", @"2_fish.png",@"3_dog.png",@"4_elephant.png",@"5_bird.png",@"6_frog.png",@"7_panda.png",@"8_fox.png",nil];
    
    passitems3 = [NSMutableArray arrayWithObjects: @"1_ball.png", @"1_equipment.png",@"2_ball.png", @"2_equipment.png"
                  ,@"3_ball.png", @"3_equipment.png",@"4_ball.png", @"4_equipment.png"
                  ,@"5_ball.png", @"5_equipment.png",@"6_ball.png", @"6_equipment.png"
                  ,@"7_ball.png", @"7_equipment.png",@"8_ball.png", @"8_equipment.png",nil];
    
    passitems4 = [NSMutableArray arrayWithObjects: @"card_red.png",@"card_orange.png",@"card_yellow.png",@"card_green.png",@"card_light green.png",@"card_blue.png",@"card_purple.png",@"card_pink.png",nil];
    
    passitems5 = [NSMutableArray arrayWithObjects: @"card_chair.png", @"card_desk.png",@"card_door.png", @"card_door2.png",@"card_lamp.png", @"card_sofa.png",@"card_sofa2.png", @"card_table.png",nil];
    
    passitems6  = [NSMutableArray arrayWithObjects: @"card_toy1.png", @"card_toy2.png",@"card_toy3.png",@"card_toy4.png",@"card_toy5.png",@"card_toy6.png",@"card_toy7.png",@"card_toy8.png",nil];
    
    passitems7  = [NSMutableArray arrayWithObjects: @"card_clothes2.png", @"card_clothes3.png",@"card_clothes4.png",@"card_hat.png",@"card_shirt.png",@"card_shoes.png",@"card_shoes2.png",@"card_trousers.png",nil];
   
    
    passitems8 = [NSMutableArray arrayWithObjects: @"card_aeroplane.png",@"card_car.png",@"card_icecream.png", @"card_minibus.png"
                  ,@"card_ship.png", @"card_taxi.png",@"card_tram.png",@"card_transportation.png",nil];
    
    passitems9 = [NSMutableArray arrayWithObjects: @"card_onion.png", @"card_vegetable.png",@"card_vegetable2.png", @"card_vegetable3.png",@"card_vegetable4.png", @"card_vegetable5.png",@"card_vegetable6.png", @"card_vegetable7.png",nil];
    
    passitems10  = [NSMutableArray arrayWithObjects: @"card_cat.png", @"card_dog.png",@"card_fish.png",@"card_horse.png",@"card_lion.png",@"card_seahorse.png",@"card_sheep.png",@"card_tiger.png",nil];
    
    passitems11  = [NSMutableArray arrayWithObjects: @"card_banana.png", @"card_coconut.png",@"card_kiwi.png",@"card_mango.png",@"card_mangosteen.png",@"card_orange.png",@"card_pear.png",@"card_strawberry.png",nil];
    

    
    passsounditems0 = [NSMutableArray arrayWithObjects: @"father",@"mama", @"grandmother"
    ,@"baby", @"grandfather",@"uncle", @"cat"
    ,@"non-understandable",nil];
    
    menuitemArr = [NSMutableArray arrayWithObjects: passitems0, passitems1,passitems2, passitems3,passitems4, passitems5,passitems6, passitems7,passitems8, passitems9,passitems10, passitems11, nil];
    
    
    SecondViewController *controller = [[SecondViewController alloc] init];
    controller.isSomethingEnabled = YES;
    
    ExampleAppDataObject* theDataObject = [self theAppDataObject];
    theDataObject.int1 = row * [self flipCardViewNumberOfColumns:flipCardView] + column;
    theDataObject.passitems = [menuitemArr objectAtIndex:theDataObject.int1];
    theDataObject.passSounditems = passsounditems0;
    
    //NSLog(@"at flipCardView menuitemArr:%d",theDataObject.int1);
    //NSLog(@"at flipCardView menuitemArr:%@",[menuitemArr objectAtIndex:0]);
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navigationBar.delegate = self;
    
    controller.navigationBar = navigationBar;
    controller.previousViewController = self;
    
    
    [flipCardView pushViewController:controller];
  
    [controller release];
    
    [navigationBar pushNavigationItem:controller.navigationItem animated:YES];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    [thumbnailView popViewController];
    return YES;
}

@end
