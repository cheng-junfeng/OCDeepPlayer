//
//  WSPageManager.h
//  ZEBBaseProject
//
//  Created by Full Stack on 2018/8/3.
//  Copyright © 2018年 zm4. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WSLaunchSceneViewController;

@interface WSPageManager : NSObject

+ (void)enterMainUI;
+ (void)enterLaunchSceneVC;

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

@end
