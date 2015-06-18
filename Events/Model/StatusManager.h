//
//  LoginStatusManager.h
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalConstants.h"
#import "UserInfoModel.h"
@interface StatusManager : NSObject

+ (void)loginWithUserInfo:(UserInfoModel *)info;
+ (BOOL)isLogin;
+ (void)registerTourID:(NSString *)tourID;
+ (NSDictionary *)parameter;
@end
