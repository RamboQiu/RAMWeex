//
//  RAMViewController.m
//  RAMWeex
//
//  Created by 625217640@qq.com on 01/22/2019.
//  Copyright (c) 2019 625217640@qq.com. All rights reserved.
//

#import "RAMViewController.h"
#import <RAMRouter/RAMRouter.h>

@interface RAMViewController ()
@property (weak, nonatomic) IBOutlet UITextField *weexTextField;

@end

@implementation RAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)button1Action:(id)sender {
    RAMRouterParam *param = [[RAMRouterParam alloc] init];
    param.url = @"router://viewcontroller1";
    param.launchMode = RAMControllerLaunchModePushNavigation;
    param.params = @{@"paramKey":@"paramValue"};
    [[RAMRouter sharedRouter] route:param];
}
- (IBAction)button2Action:(id)sender {
    RAMRouterParam *param = [[RAMRouterParam alloc] init];
    param.url = @"router://viewcontroller2";
    param.launchMode = RAMControllerLaunchModePushNavigation;
    param.params = @{@"paramKey":@"paramValue"};
    [[RAMRouter sharedRouter] route:param];
}
- (IBAction)weexButtonAction:(id)sender {
    RAMRouterParam *param = [[RAMRouterParam alloc] init];
    param.url = @"router://weex";
    param.launchMode = RAMControllerLaunchModePushNavigation;
    param.params = @{@"url":self.weexTextField.text?:@"http://10.216.40.12:8081/dist/index.js"};
    [[RAMRouter sharedRouter] route:param];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
