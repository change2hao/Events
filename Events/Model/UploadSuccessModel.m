//
//  UploadSuccessModel.m
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "UploadSuccessModel.h"

@implementation UploadSuccessModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"errorCode": @"imageData.data.error"
            };
}
@end
