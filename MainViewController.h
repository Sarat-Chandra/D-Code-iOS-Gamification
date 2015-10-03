//
//  MainViewController.h
//  frog_ipad
//
//  Created by Varanasi, Sarat Chandra on 8/25/13.
//  Copyright (c) 2013 rat chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface MainViewController : UIViewController
-(IBAction)gotoFrog:(id)sender;
@property (strong,nonatomic) ViewController *frogController;

@end
