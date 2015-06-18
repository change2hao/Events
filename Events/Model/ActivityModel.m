//
//  ActivityModel.m
//  Events
//
//  Created by tianliwei on 6/16/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"tour_id": @"tour_id",
             @"name": @"name",
             @"photo": @"photo",
             @"describe": @"describe",
             @"date": @"date",
             @"status": @"status"
             };
}

@end
