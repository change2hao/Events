//
//  LoginStatusManager.m
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "StatusManager.h"
@implementation StatusManager

+ (void)loginWithUserInfo:(UserInfoModel *)info{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAutoLogin];
    [[NSUserDefaults standardUserDefaults] setValue:info.openid forKey:kWeiXinID];
    [[NSUserDefaults standardUserDefaults] setValue:info.nickname forKey:kWeiXinName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isLogin{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kAutoLogin];
}

+ (void)registerTourID:(NSString *)tourID{
    [[NSUserDefaults standardUserDefaults] setValue:tourID forKey:kTourID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)openID{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kWeiXinID];
}

+ (NSString *)nickName{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kWeiXinName];
}

+ (NSString *)tourID{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kTourID];
}

+ (NSDictionary *)parameter{
    return @{@"weixin_id" : [[self class] openID],
             @"weixin_name" : [[self class] nickName],
             @"tour_id" : [[self class] tourID]
            };
}
@end
