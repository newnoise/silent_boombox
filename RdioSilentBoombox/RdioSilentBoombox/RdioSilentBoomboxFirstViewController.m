//
//  RdioSilentBoomboxFirstViewController.m
//  RdioSilentBoombox
//
//  Created by Thomas Ituarte on 2/16/13.
//  Copyright (c) 2013 Thomas Ituarte. All rights reserved.
//

#import "RdioSilentBoomboxFirstViewController.h"

@interface RdioSilentBoomboxFirstViewController ()
@property (nonatomic) BOOL userHasLoggedIn;

@end

@implementation RdioSilentBoomboxFirstViewController

@synthesize userHasLoggedIn = _userHasLoggedIn;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning  
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    NSLog(@"Test");

}

@end
    