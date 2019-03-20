//
//  WSPageManager.m
//  ZEBBaseProject
//
//  Created by Full Stack on 2018/8/3.
//  Copyright © 2018年 zm4. All rights reserved.
//

#import "WSPageManager.h"
#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "WSLaunchSceneViewController.h"
#import "AppDelegate+TabBar.h"

@implementation WSPageManager

+ (void)replaceRootViewController:(UIViewController *)controller {
    [WSPageManager restoreRootViewController:controller];
}

+ (void)enterMainUI {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.baseTabBarController = nil;
    delegate.baseTabBarController = [delegate createViewControllers];
    [self replaceRootViewController:delegate.baseTabBarController];
}

+ (void)enterLaunchSceneVC {
    WSLaunchSceneViewController *vc = [[WSLaunchSceneViewController alloc] init];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = vc;
    [delegate.window makeKeyAndVisible];
}

// 登陆后淡入淡出更换rootViewController
+ (void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.2f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}

@end
