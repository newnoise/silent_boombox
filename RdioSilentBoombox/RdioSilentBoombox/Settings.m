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

#import "Settings.h"


@implementation Settings


#pragma mark
#pragma mark Rdio Settings getters/setters

-(void)setRdioAccessToken:(NSString *)token
{
  [dictionary_ setValue:token forKey:@"rdioAccessToken"];
}

-(NSString *)rdioAccessToken
{
  return [dictionary_ objectForKey:@"rdioAccessToken"];
}

-(void)setRdioUser:(NSString *)user
{
  [dictionary_ setValue:user forKey:@"rdioUser"];
}

-(NSString *)rdioUser
{
  return [dictionary_ objectForKey:@"rdioUser"];
}

-(void)setRdioVanityName:(NSString *)rdioVanityName
{
    [dictionary_ setValue:rdioVanityName forKey:@"rdioVanityName"];
}

-(NSString *)rdioVanityName 
{
    return [dictionary_ objectForKey:@"rdioVanityName"];
}

-(void)setRdioUserKey:(NSString *)userKey
{
  [dictionary_ setValue:userKey forKey:@"rdioUserKey"];
}

-(NSString*)rdioUserKey
{
  return [dictionary_ objectForKey:@"rdioUserKey"];
}

-(void)setRdioIcon:(NSString *)iconUrl
{
  [dictionary_ setValue:iconUrl forKey:@"rdioIcon"];
}

-(NSString*)rdioIcon
{
  return [dictionary_ objectForKey:@"rdioIcon"];
}

#pragma mark
#pragma mark FourSquare getters/setters

-(void)setFsqAccessToken:(NSString *)token
{
  [dictionary_ setValue:token forKey:@"fsqAccessToken"];
}

-(NSString *)fsqAccessToken
{
  return [dictionary_ objectForKey:@"fsqAccessToken"];
}

-(void)setFsqUser:(NSString *)user
{
  [dictionary_ setValue:user forKey:@"fsqUser"];
}

-(NSString *)fsqUser
{
  return [dictionary_ objectForKey:@"fsqUser"];
}

-(void)setFsqUserKey:(NSString *)userKey
{
  [dictionary_ setValue:userKey forKey:@"fsqUserKey"];
}

-(NSString*)fsqUserKey
{
  return [dictionary_ objectForKey:@"fsqUserKey"];
}

-(void)setFsqIcon:(NSString *)iconUrl
{
  [dictionary_ setValue:iconUrl forKey:@"fsqIcon"];
}

-(NSString*)fsqIcon
{
  return [dictionary_ objectForKey:@"fsqIcon"];
}

#pragma mark
#pragma mark Settings constructors, saver, resetter.

+ (Settings*)settings
{
  static Settings *settings_;
  
  if (settings_) {
    return settings_;
  }
  
  @synchronized(self) {
    if (!settings_){
      settings_ = [[self alloc] init];
    }
  }
  
  return settings_;
}

- (NSString*)filePath
{
  if (filePath_ == nil) {
    filePath_ = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
                  stringByAppendingPathComponent:@"rdio-foursquare-jukebox.settings"];
  }
  return filePath_;
}

- (id)init
{
  if (self = [super init])
  {
    @try
    {
      dictionary_ = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    }
    @catch (NSException *exception)
    {
      NSLog(@"Exception loading settings. %@, %@", exception.name, exception.reason);
    }
    if (dictionary_ == nil)
    {
      dictionary_ = [NSMutableDictionary dictionaryWithCapacity:10];
    }
  }
  return self;
}

//////////////////////////////////////////////////////////////////////////////////////////////////
- (void)save {
  NSLog(@"About to save settings");
  [NSKeyedArchiver archiveRootObject:dictionary_
                              toFile:[self filePath]];
  NSLog(@"Settings saved.");
}

- (void)reset {
  [(NSMutableDictionary *)dictionary_ removeAllObjects];
}

@end
