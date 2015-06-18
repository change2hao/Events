//
//  AccessTokenModel.h
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface AccessTokenModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *expires_in;
@property (nonatomic, copy) NSString *refresh_token;
@property (nonatomic, copy) NSString *openid;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSString *unionid;

@end
