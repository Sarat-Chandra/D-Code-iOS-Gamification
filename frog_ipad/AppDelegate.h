//
//  AppDelegate.h
//  frog_ipad
//
//  Created by Varanasi, Sarat Chandra on 8/25/13.
//  Copyright (c) 2013 rat chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong,nonatomic)  MainViewController *mainViewController;
@end
