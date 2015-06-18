//
//  Macros.h
//  OVORemote
//
//  Created by tianliwei on 1/12/14.
//  Copyright (c) 2014 tianliwei. All rights reserved.
//

#ifndef OVORemote_Macros_h
#define OVORemote_Macros_h


//UIKit
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define UI_SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define UI_SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

//Notification




#define App_Delegate [UIApplication sharedApplication].delegate
#define App_Window   [UIApplication sharedApplication].delegate.window
#define App_RootVC   [UIApplication sharedApplication].delegate.window.rootViewController
#define APP_URL @"http://itunes.apple.com/lookup?id=648729884"

#endif
