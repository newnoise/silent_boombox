//
//  RdioSilentBoomboxFirstViewController.h
//  RdioSilentBoombox
//
//  Created by Thomas Ituarte on 2/16/13.
//  Copyright (c) 2013 Thomas Ituarte. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RdioDelegate, RDAPIRequestDelegate, RDPlayerDelegate;


@interface RdioSilentBoomboxFirstViewController : UIViewController <RdioDelegate, RDAPIRequestDelegate, RDPlayerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *rdioLoginStatusLabel;
@property (strong, nonatomic) IBOutlet UIButton *loginButtonProperty;


@end
