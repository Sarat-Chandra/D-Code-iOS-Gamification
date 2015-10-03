//
//  MainViewController.m
//  frog_ipad
//
//  Created by Varanasi, Sarat Chandra on 8/25/13.
//  Copyright (c) 2013 rat chan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize frogController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!frogController)
        frogController = [ViewController getSharedViewController];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)gotoFrog:(id)sender
{
    
    [self presentViewController:frogController animated:YES completion:^(void){}];
    
}


@end
