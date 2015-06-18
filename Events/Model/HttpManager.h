//
//  HttpManager.h
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MTLModel.h"
#import "AccessTokenModel.h"
#import "UserInfoModel.h"
#import "ActivityModel.h"
#import "UploadSuccessModel.h"
@interface HttpManager : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

- (void)getAccessTokenWithAppID:(NSString *)appID secret:(NSString *)secret code:(NSString *)code completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock;

- (void)getUserInfoWithAccessToken:(NSString *)accessToken openId:(NSString *)openId completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock;

- (void)getTourActivityCompletion:(void (^)(NSArray *results))completionBlock error:(void (^)(NSString *error))errorBlock;

- (void)postPhotoWithData:(UIImage *)image parameter:(NSDictionary *)parameter completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock;
@end
