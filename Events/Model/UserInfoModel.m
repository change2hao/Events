//
//  UserInfoModel.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "UserInfoModel.h"
#import "MTLValueTransformer.h"

@implementation UserInfoModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
    @"openid": @"openid",
    @"nickname": @"nickname",
    @"sex": @"sex",
    @"province": @"province",
    @"city": @"city",
    @"country": @"country",
    @"headimgurl": @"headimgurl",
    @"privilege": @"privilege",
    @"unionid": @"unionid"
    };
}

+ (NSValueTransformer *)sexJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSNumber *sex = (NSNumber *)value;
        if ([sex integerValue] == 1){
            return @"男";
        }else if ([sex integerValue] == 2){
            return @"女";
        }else{
            return nil;
        }
    }];
}

@end
