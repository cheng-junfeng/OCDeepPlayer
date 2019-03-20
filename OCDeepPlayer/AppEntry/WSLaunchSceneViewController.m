//
//  WSLaunchSceneViewController.m
//  ZEBBaseProject
//
//  Created by Full Stack on 2018/8/3.
//  Copyright © 2018年 zm4. All rights reserved.
//  启动图界面

#import "WSLaunchSceneViewController.h"
#import <Lottie/Lottie.h>
#import "WSPageManager.h"

@interface WSLaunchSceneViewController ()

@property (nonatomic, strong) UIImageView *launchView;

@property (nonatomic, strong) LOTAnimationView *lottieLogo;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *areaLabel;
@property (nonatomic, strong) UILabel *versionLabel;
@property (nonatomic, strong) UILabel *showLabel;
@end

@implementation WSLaunchSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLaunch];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.lottieLogo play];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [WSPageManager enterMainUI];
    });
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.lottieLogo pause];
}

- (void)initLaunch {
    [self.view addSubview:self.launchView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.lottieLogo];
    
    [self.view addSubview:self.areaLabel];
    [self.view addSubview:self.versionLabel];
    [self.view addSubview:self.showLabel];
    
    [self.launchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.right.equalTo(self.view);
    }];
    [self.lottieLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
    [self.areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.height.mas_equalTo(100);
    }];
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.areaLabel.mas_top).offset(20);
    }];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.versionLabel.mas_bottom).offset(20);
    }];
}
- (UIImageView *)launchView {
    if (!_launchView) {
        _launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"night.png"]];
        _launchView.frame = self.view.bounds;
        _launchView.contentMode=UIViewContentModeScaleAspectFit;
        _launchView.animationRepeatCount = 3;
    }
    return _launchView;
}
- (LOTAnimationView *)lottieLogo {
    if (!_lottieLogo) {
        _lottieLogo = [LOTAnimationView animationNamed:@"deer"];
        _lottieLogo.contentMode = UIViewContentModeCenter;
//        _lottieLogo.
    }
    return _lottieLogo;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [ZEBUI createLabelWithbackGroundColor:nil textAlignment:NSTextAlignmentCenter font:KFont(36) textColor:[UIColor whiteColor] text:@"小鹿快跑"];
    }
    return _titleLabel;
}
- (UILabel *)areaLabel {
    if (!_areaLabel) {
        _areaLabel = [ZEBUI createLabelWithbackGroundColor:RGBACOLOR(115, 115, 115, 0.3) textAlignment:NSTextAlignmentCenter font:KFont(36) textColor:[UIColor whiteColor] text:@""];
    }
    return _areaLabel;
}
- (UILabel *)versionLabel {
    if (!_versionLabel) {
        _versionLabel = [ZEBUI createLabelWithbackGroundColor:nil textAlignment:NSTextAlignmentCenter font:KFont(18) textColor:[UIColor whiteColor] text:@"V1.0.1"];
    }
    return _versionLabel;
}
- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [ZEBUI createLabelWithbackGroundColor:nil textAlignment:NSTextAlignmentCenter font:KFont(16) textColor:[UIColor whiteColor] text:@"一款基于共享的视频播放器"];
    }
    return _showLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
