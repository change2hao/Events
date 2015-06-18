//
//  UrlFormatter.h
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlFormatter : NSObject

+ (NSString *)formatAccessTokenUrlWithAppID:(NSString *)appID secret:(NSString *)secret code:(NSString *)code;
+ (NSString *)formatUserInfoUrlWithAccessToken:(NSString *)accessToken openId:(NSString *)openId;
@end
