/*
 Copyright (c) 2011 Rdio Inc
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <Foundation/Foundation.h>


@interface Settings : NSObject
{
  NSDictionary *dictionary_;
  NSString *filePath_;
}

+(Settings *)settings;

@property (strong, nonatomic) NSString *rdioAccessToken;
@property (strong, nonatomic) NSString *rdioUser;
@property (strong, nonatomic) NSString *rdioVanityName;
@property (strong, nonatomic) NSString *rdioUserKey;
@property (strong, nonatomic) NSString *rdioIcon;

@property (strong, nonatomic) NSString *fsqAccessToken;
@property (strong, nonatomic) NSString *fsqUser;
@property (strong, nonatomic) NSString *fsqUserKey;
@property (strong, nonatomic) NSString *fsqIcon;

-(void)save;
-(void)reset;

@end
