//
//  UploadSuccessModel.h
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"
@interface UploadSuccessModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSNumber *errorCode;
@end
