//
//  ViewController.h
//  frog_ipad
//
//  Created by Varanasi, Sarat Chandra on 8/25/13.
//  Copyright (c) 2013 rat chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
@property (strong,nonatomic) NSMutableArray *alphaViews;
@property (strong,nonatomic) UIButton IBOutlet *resetButton;
-(void)rockTapped:(id)object;
@property (strong,nonatomic) AVAudioPlayer *splashPlayer;
@property (strong,nonatomic) AVAudioPlayer *backgroundPlayer;
@property (strong,nonatomic) AVAudioPlayer *jumpPlayer;
@property (strong,nonatomic) AVAudioPlayer *croakPlayer;
@property (strong,nonatomic) UIImageView IBOutlet *frogView;
-(IBAction)reset:(id)sender;

+(id)getSharedViewController;
@end
