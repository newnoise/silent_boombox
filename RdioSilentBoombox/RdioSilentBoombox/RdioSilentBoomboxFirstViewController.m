//
//  RdioSilentBoomboxFirstViewController.m
//  RdioSilentBoombox
//
//  Created by Thomas Ituarte on 2/16/13.
//  Copyright (c) 2013 Thomas Ituarte. All rights reserved.
//

#import "RdioSilentBoomboxFirstViewController.h"
#import "RdioSilentBoomboxAppDelegate.h"
#import "Settings.h"
#import <Rdio/Rdio.h>

@interface RdioSilentBoomboxFirstViewController ()
@property (nonatomic) BOOL userHasLoggedInToRdio;
//@property (readonly) Rdio *
- (void)syncRdioButton;

@end

@implementation RdioSilentBoomboxFirstViewController

//@synthesize playButton = _playButton;
//@synthesize player = _player;

@synthesize userHasLoggedInToRdio  = _userHasLoggedInToRdio;
@synthesize loginButtonProperty = _loginButtonProperty;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Rdio *sharedRdio = [RdioSilentBoomboxAppDelegate rdioInstance];
    [sharedRdio setDelegate:self];
    //[[sharedRdio player] setDelegate:self];
    NSString *accessToken = [[Settings settings] rdioAccessToken];
    if (accessToken && ![sharedRdio user])
    {
        // try authenticating using settings.
        [sharedRdio authorizeUsingAccessToken:accessToken fromController:self];
    }

}

- (void)didReceiveMemoryWarning  
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    NSLog(@"Test");
    NSLog(@"link to rdio pressed!");
    if (_userHasLoggedInToRdio) {
        [[RdioSilentBoomboxAppDelegate rdioInstance] logout];
    } else {
        [[RdioSilentBoomboxAppDelegate rdioInstance] authorizeFromController:self];
    }
}

- (void)syncRdioButton
{
    NSLog(@"inside syncRdioButton");
    NSLog(@"%@",[[Settings settings] rdioUser]);
    
    if ([[Settings settings] rdioAccessToken]) {
        //User is logged into Rdio
        NSString *username = [[Settings settings] rdioUser];
        [self.rdioLoginStatusLabel setText:[NSString stringWithFormat:@"Logged in as %@", username]];
        [_loginButtonProperty setTitle:@"Logout of Rdio" forState:UIControlStateNormal];
        _userHasLoggedInToRdio = YES;
    } else {
        //User is not logged into Rdio
        [self.rdioLoginStatusLabel setText:@""];
        [_loginButtonProperty setTitle:@"Login to Rdio" forState:UIControlStateNormal];
        _userHasLoggedInToRdio = NO;
    }
     
}


#pragma mark -
#pragma mark RdioDelegate methods
/**
 * The user has successfully authorized the application, so we should store the access token
 * and any other information we might want access to later.
 */

- (void)rdioDidAuthorizeUser:(NSDictionary *)user withAccessToken:(NSString *)accessToken {
    [[Settings settings] setRdioUser:[NSString stringWithFormat:@"%@ %@", [user valueForKey:@"firstName"], [user valueForKey:@"lastName"]]];
    [[Settings settings] setRdioAccessToken:accessToken];
    [[Settings settings] setRdioUserKey:[user objectForKey:@"key"]];
    [[Settings settings] setRdioIcon:[user objectForKey:@"icon"]];
    [[Settings settings] save];
    
    [self syncRdioButton];
}

/**
 * Authentication failed so we should alert the user.
 */
- (void)rdioAuthorizationFailed:(NSString *)message {
    NSLog(@"Rdio authorization failed: %@", message);
}

/**
 * Called if the user logs out
 */
- (void)rdioDidLogout
{
    [[Settings settings] reset];
    [[Settings settings] save];
    [self syncRdioButton];
}



@end
    