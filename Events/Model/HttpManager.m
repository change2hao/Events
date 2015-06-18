//
//  HttpManager.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "HttpManager.h"
#import "UrlFormatter.h"
@implementation HttpManager

- (instancetype)init{
    if (self = [super init]){
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}

- (void)getAccessTokenWithAppID:(NSString *)appID secret:(NSString *)secret code:(NSString *)code completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock{
    NSString *formatUrlStr = [UrlFormatter formatAccessTokenUrlWithAppID:appID secret:secret code:code];
    [_manager GET:formatUrlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        AccessTokenModel *model = [MTLJSONAdapter modelOfClass:[AccessTokenModel class] fromJSONDictionary:dict error:nil];
        completionBlock(model);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error description]);
    }];
}

- (void)getUserInfoWithAccessToken:(NSString *)accessToken openId:(NSString *)openId completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock{
    NSString *formatUrlStr = [UrlFormatter formatUserInfoUrlWithAccessToken:accessToken openId:openId];
    [_manager GET:formatUrlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        UserInfoModel *model = [MTLJSONAdapter modelOfClass:[UserInfoModel class] fromJSONDictionary:dict error:nil];
        completionBlock(model);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error description]);
    }];
}

- (void)getTourActivityCompletion:(void (^)(NSArray *results))completionBlock error:(void (^)(NSString *error))errorBlock{
    [_manager GET:@"http://api.tour.aymdx.com/index/get_activity" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *models = [NSMutableArray array];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for(NSDictionary *dict in array){
            ActivityModel *model = [MTLJSONAdapter modelOfClass:[ActivityModel class] fromJSONDictionary:dict error:nil];
            [models addObject:model];
        }
        completionBlock(models);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error description]);
    }];
}

- (void)postPhotoWithData:(UIImage *)image parameter:(NSDictionary *)parameter completion:(void (^)(MTLModel *result))completionBlock error:(void (^)(NSString *error))errorBlock{
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [_manager POST:@"http://api.tour.aymdx.com/index/upload/" parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFormData:data name:@"image.PNG"];
        [formData appendPartWithFileData:data name:@"imageData" fileName:@"test.png" mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"============\r\n%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        NSLog(@"Success: %@", dict);
        UploadSuccessModel *model = [MTLJSONAdapter modelOfClass:[UploadSuccessModel class] fromJSONDictionary:dict error:nil];
        completionBlock(model);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error description]);
    }];
}

@end
