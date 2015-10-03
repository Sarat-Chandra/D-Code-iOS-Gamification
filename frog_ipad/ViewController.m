//
//  ViewController.m
//  frog_ipad
//
//  Created by Varanasi, Sarat Chandra on 8/25/13.
//  Copyright (c) 2013 rat chan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize frogView,backgroundPlayer,jumpPlayer,croakPlayer,alphaViews,splashPlayer;
@synthesize resetButton;
+(id)getSharedViewController
{
    static ViewController *frogViewController = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        frogViewController =[[self  alloc] initWithNibName:@"ViewController" bundle:nil];
    });
    
    return frogViewController;
    

}

CGPoint getToPoint(CGRect rectRock,CGRect rectFrog)
{
    return CGPointMake(rectRock.origin.x + rectRock.size.width/2 - rectFrog.size.width/2, rectRock.origin.y + rectRock.size.height/2 - rectFrog.size.height/2);
}

float distance(CGPoint p1,CGPoint p2)
{
    return sqrt((p2.x - p1.x)*(p2.x - p1.x) + (p2.y - p1.y)*(p2.y - p1.y));
}
-(void)rockTapped:(id)object

{
    
    
    
    
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)object;
    UIImageView *iView = (UIImageView*) tap.view;
    
    if(distance(frogView.frame.origin,iView.frame.origin) > 230)
        return;
    
       [croakPlayer play];
    NSLog(@"rock tapped");
    CGPoint toPoint = getToPoint(iView.frame,frogView.frame);

    [UIView animateWithDuration:0.5 animations:^(void)
     {
         [frogView setFrame:CGRectMake(toPoint.x,toPoint.y,frogView.frame.size.width,frogView.frame.size.height)];

                  
         
     }  completion:^(BOOL finished)
     {
         if(finished)
         {
             
             [UIView animateWithDuration:0.3 animations:^(void){
                 
                 [iView  setFrame:CGRectInset(iView.frame, -10, -10)];
                  [iView setFrame:CGRectInset(iView.frame, 10, 10)];
             }];
             
             if(iView.tag == 14)
             {
                 UILabel *tempLabel;
                 for(tempLabel in alphaViews)
                     if(tempLabel.tag == iView.tag + 6)
                         break;
                 [UIView animateWithDuration:0.4 animations:^(void){
                     
                     
                     [tempLabel setHidden:YES];
                     [iView setHidden:YES];
                     [frogView setHidden:YES];
                     
                     
                     
                 } completion:^(BOOL finished){
                    if(finished)
                    {
                          [splashPlayer play];
                        [resetButton setHidden:NO];
                    }
                      
                 
                 
                 }];
                 return;
             }
             

             [jumpPlayer play];
             
         }
     }];
    
       
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(!alphaViews)
        alphaViews = [[NSMutableArray alloc] init];
    NSMutableArray *alphabets = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C", nil];
    NSError *error;
    NSURL *url;
    url = [[NSBundle mainBundle] URLForResource: @"splash"
                                  withExtension: @"mp3"];

    
    splashPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    url = [[NSBundle mainBundle] URLForResource: @"jump1"
                                  withExtension: @"mp3"];

    jumpPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    url = [[NSBundle mainBundle] URLForResource: @"croak1"
                                  withExtension: @"mp3"];
    
    croakPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];

    
    int count = 3;
    for(UIView *iView in [self.view subviews])
    {
        
        if(iView.tag == 99)
            [iView setHidden:YES];
        else
        [iView setHidden:NO];
        
        if(iView.tag == 13 || iView.tag == 14 || iView.tag == 15 || iView.tag == 16)
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
            [tap setDelegate:self];
            [tap addTarget:self action:@selector(rockTapped:)];
            [(UIImageView*)iView addGestureRecognizer:tap];
            [(UIImageView *)iView setUserInteractionEnabled:YES];
 
        }
        
        if(iView.tag >19 && iView.tag < 23)
        {
           
            int i = arc4random_uniform(count);
            count--;
            [alphaViews addObject:(UILabel *)iView];
            [(UILabel*)iView setText:[alphabets objectAtIndex:i]];
            [alphabets removeObjectAtIndex:i];
            
        }
    }
    url = [[NSBundle mainBundle] URLForResource: @"background"
                                         withExtension: @"mp3"];
    
    backgroundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url  error:&error];
    //[backgroundPlayer setDelegate:self];
    // [backgroundPlayer prepareToPlay];
    backgroundPlayer.numberOfLoops = -1;
    BOOL success =  [backgroundPlayer play];
    BOOL isPlaying =  [backgroundPlayer isPlaying];

	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)reset:(id)sender
{
    [self viewDidLoad];
    [frogView setFrame:CGRectMake(313,914,70,70)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
