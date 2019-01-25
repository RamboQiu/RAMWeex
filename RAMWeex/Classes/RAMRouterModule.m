//
//  RAMRouterModule.m
//  RAMWeex
//
//  Created by 裘俊云 on 2019/1/23.
//

#import "RAMRouterModule.h"
#import <RAMrouter/UIViewController+RAMUtils.h>
#import <RAMRouter/RAMRouter.h>

@implementation RAMRouterModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(routeByUrl:finish:))
WX_EXPORT_METHOD(@selector(route:finish:data:))

-(void)routeByUrl:(NSString *)schemeUrl finish:(BOOL)finish{
    if (![schemeUrl isKindOfClass:NSString.class] || schemeUrl.length == 0) {
        return ;
    }
    
    [[RAMRouter sharedRouter] routeWithUrl:schemeUrl];
    if(finish){
        [self.weexInstance.viewController ram_removeFromControllerTree:^(BOOL cb) {}];
    }
}

-(void)route:(NSString *)schemeUrl finish:(BOOL)finish data:(NSDictionary *)data{
    if (![schemeUrl isKindOfClass:NSString.class] || schemeUrl.length == 0) {
        return ;
    }
    RAMRouterParam *param = [[RAMRouterParam alloc] initWithURL:schemeUrl launchMode:RAMControllerLaunchModePushNavigation];
    param.params = [data copy];
    [[RAMRouter sharedRouter] route:param];
    if(finish){
        [self.weexInstance.viewController ram_removeFromControllerTree:^(BOOL cb) {
        }];
    }
}
@end
