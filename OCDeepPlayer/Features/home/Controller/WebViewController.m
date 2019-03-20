//
//  WebViewController.m
//  OCDeepPlayer
//
//  Created by wutos on 2019/3/20.
//  Copyright © 2019年 wutos. All rights reserved.
//

#import "WebViewController.h"
#import "WSWKWebView.h"

@interface WebViewController ()<WSWKWebViewDelegate> {
    BOOL _isLoad;
    BOOL _displaying;
}
@property (nonatomic, strong) WSWKWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self showHudInView:self.view hint:LoadingAlert];
    self.webView.url = self.mUrl;
}
- (void)initUI {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.top.equalTo(self.view);
    }];
}
#pragma mark - WSWKWebViewDelegate
- (void)wsWKWebView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    _isLoad = NO;
}
- (void)wsWKWebView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    _isLoad = YES;
    [self hideHud];
}
- (void)wsWKWebView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
}
#pragma mark - 懒加载
- (WSWKWebView *)webView {
    if (!_webView) {
        _webView = [[WSWKWebView alloc] init];
        _webView.delegate = self;
    }
    return _webView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
