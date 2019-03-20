//
//  UIViewController+HUD.h
//  OCDeepPlayer
//
//  Created by wutos on 2019/3/20.
//  Copyright © 2019年 wutos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIViewController (HUD)

- (MBProgressHUD *)HUD;

- (void)setHUD:(MBProgressHUD *)HUD;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint Time:(NSTimeInterval) time;

- (void)showHint:(NSString *)hint;

- (void)showloadingName:(NSString *)loadingName;


- (void)showloadingNameHor:(NSString *)loadingName;

// 错误提示
- (void)showloadingError:(NSString *)errorInfo;

@end
