//
//  AccessTokenModel.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "AccessTokenModel.h"

@implementation AccessTokenModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"access_token": @"access_token",
             @"expires_in": @"expires_in",
             @"refresh_token": @"refresh_token",
             @"openid": @"openid",
             @"scope": @"scope",
             @"unionid": @"unionid",
             };
}

@end
