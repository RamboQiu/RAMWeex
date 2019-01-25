//
//  RAMWeexManager.m
//  RAMWeex_Example
//
//  Created by 裘俊云 on 2019/1/23.
//  Copyright © 2019 625217640@qq.com. All rights reserved.
//

#import "RAMWeexManager.h"
#import <WeexSDK.h>
#import <RAMWeex/RAMRouterModule.h>
#import <RAMWeex/RAMImageLoader.h>

@implementation RAMWeexManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static RAMWeexManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [self new];
//        manager.weexEnable = NO;
//        manager.currentCacheItemDic = [NSMutableDictionary dictionary];
    });
    return manager;
}

-(void)initWeexEnv{
    [WXAppConfiguration setAppGroup:@"RAMWeexGroup"];
    [WXAppConfiguration setAppName:@"RAMWeexApp"];
    [WXSDKEngine initSDKEnvironment];
    //register custom module and component，optional
    [WXSDKEngine registerModule:@"RAMRouter" withClass:[RAMRouterModule class]];
//    [WXSDKEngine registerModule:@"NEService" withClass:[NEServiceModule class]];
//    [WXSDKEngine registerModule:@"NEStatistics" withClass:[NEStatisticsModule class]];
//    [WXSDKEngine registerModule:@"NEShare" withClass:[NEShareModule class]];
//    [WXSDKEngine registerModule:@"NENavigationBar" withClass:[NENavigationBarModule class]];
//    [WXSDKEngine registerModule:@"NECookies" withClass:[NECookiesModule class]];
//    [WXSDKEngine registerModule:@"NELogin" withClass:[NELoginModule class]];
//    [WXSDKEngine registerModule:@"NECommentModule" withClass:[NECommentModule class]];
    [WXSDKEngine registerHandler:[RAMImageLoader new] withProtocol:@protocol(WXImgLoaderProtocol)];
//    [WXSDKEngine registerComponent:@"nerefresh" withClass:[NERefreshComponent class]];
//    [WXSDKEngine registerComponent:@"nelookgallery" withClass:[NELookGalleryComponent class]];
}
@end
