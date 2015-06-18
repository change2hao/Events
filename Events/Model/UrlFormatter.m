//
//  UrlFormatter.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "UrlFormatter.h"

@implementation UrlFormatter

+ (NSString *)formatAccessTokenUrlWithAppID:(NSString *)appID secret:(NSString *)secret code:(NSString *)code{
    return [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",appID,secret,code];
}
+ (NSString *)formatUserInfoUrlWithAccessToken:(NSString *)accessToken openId:(NSString *)openId{
    return [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",accessToken,openId];
}

@end
