//
//  RAMWeexManager.h
//  RAMWeex_Example
//
//  Created by 裘俊云 on 2019/1/23.
//  Copyright © 2019 625217640@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RAMWeexManager : NSObject
+ (instancetype)shareManager;

- (void)initWeexEnv;
@end
