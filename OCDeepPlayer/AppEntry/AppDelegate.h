//
//  AppDelegate.h
//  OCDeepPlayer
//
//  Created by wutos on 2019/3/20.
//  Copyright © 2019年 wutos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) BaseTabBarController  *baseTabBarController;

@end

