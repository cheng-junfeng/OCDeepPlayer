//
//  WSApp.m
//  ZEBBaseProject
//
//  Created by Full Stack on 2018/8/2.
//  Copyright © 2018年 zm4. All rights reserved.
//

#import "WSApp.h"

@implementation WSApp

+ (WSApp*)startApp
{
    __strong static id _sharedObject = nil;
    @synchronized(self) {//同步 执行 防止多线程操作
        if (_sharedObject == nil) {
            _sharedObject = [[self alloc] init];
        }
    }
    return _sharedObject;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initall];
    }
    return self;
}

- (void)initall {
    [self initNavigationBar];
}
//初始化导航栏
- (void)initNavigationBar {
    
    //将返回按钮title 文字的颜色改为透明
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]}forState:UIControlStateNormal];
    if (@available(iOS 11.0, *)) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-100,0) forBarMetrics:UIBarMetricsDefault];
    }else {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:RGBCOLOR(131, 105, 81)];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UITabBar appearance] setTintColor:RGBCOLOR(131, 105, 81)];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}
@end
