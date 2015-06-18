//
//  AppDelegate.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import "HttpManager.h"
#import "WechatConstants.h"
#import "StatusManager.h"
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [WXApi registerApp:@"wxa5c8405175c340dc"];
    NSString *storyboardName = [StatusManager isLogin] ? @"Main" : @"Login";
    UIStoryboard *board = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController *rootViewController = board.instantiateInitialViewController;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WXApi handleOpenURL:url delegate:self];
}

-(void)onResp:(BaseResp*)resp{
    if (resp.errCode == 0){
        if ([resp isKindOfClass:[SendAuthResp class]]){
            SendAuthResp *sendAuthResp = (SendAuthResp *)resp;
            NSString *code = sendAuthResp.code;
            HttpManager *httpManager = [[HttpManager alloc]init];
            [httpManager getAccessTokenWithAppID:kWechatID secret:kWechatSecret code:code completion:^(MTLModel *result) {
                AccessTokenModel *model = (AccessTokenModel *)result;
                [httpManager getUserInfoWithAccessToken:model.access_token openId:model.openid completion:^(MTLModel *result) {
                    [StatusManager loginWithUserInfo:(UserInfoModel *)result];
                    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                    [self.window setRootViewController:board.instantiateInitialViewController];
                    [self.window makeKeyAndVisible];
                    //NSLog(@"%@",model.sex);
                } error:^(NSString *error) {
                    //
                }];
            } error:^(NSString *error) {
                //
            }];
        }
    }
}

@end
