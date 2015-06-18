//
//  ActivityModel.h
//  Events
//
//  Created by tianliwei on 6/16/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface ActivityModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *tour_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *describe;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *status;

@end
