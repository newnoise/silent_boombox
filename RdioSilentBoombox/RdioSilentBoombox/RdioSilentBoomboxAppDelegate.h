//
//  RdioSilentBoomboxAppDelegate.h
//  RdioSilentBoombox
//
//  Created by Thomas Ituarte on 2/16/13.
//  Copyright (c) 2013 Thomas Ituarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rdio/Rdio.h>

@interface RdioSilentBoomboxAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly) Rdio *rdio;

+ (Rdio*)rdioInstance;

@end

