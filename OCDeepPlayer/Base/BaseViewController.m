//
//  BaseViewController.m
//  ZEBBaseProject
//
//  Created by zm4 on 2018/7/3.
//  Copyright © 2018年 zm4. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;

    //适配ios11
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    if(!self.ignoreTap){
        [self initTapImageView];
    }
    [self initNotification];
}
- (void)initNotification {}
+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}
- (void)initTableView {
    
    [self.view addSubview:self.tableView];
    self.canTopRefresh = self.canBottomRefresh = NO;
    
}
- (void)initTapImageView {
    self.smailNum = 0;
    self.bigNum = 0;//默认上滑
    int rightPadding = 80;
    int bottomPadding = 80;
    switch (self.paddingHeight) {
        case H_LITTLE:
            bottomPadding = 60;
            break;
        case H_NORMAL:
            bottomPadding = 80;
            break;
        case H_SMAIL:
            bottomPadding = 100;
            break;
        case H_MID:
            bottomPadding = 120;
            break;
        case H_BIG:
            bottomPadding = 160;
            break;
        case H_SUPER:
            bottomPadding = 240;
            break;
        default:
            break;
    }
    if(!self.hidesBottomBarWhenPushed){
        bottomPadding = bottomPadding + 48;
    }
    self.tapView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - rightPadding,  kScreenHeight - bottomPadding, 50, 50)];
    [self.view addSubview:self.tapView];
    [self.view bringSubviewToFront:self.tapView];
    self.tapView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoTopView:)];
    self.tapView.hidden = YES;
    [self.tapView addGestureRecognizer:tapGesture];
    self.tapView.layer.masksToBounds = YES;
    self.tapView.layer.cornerRadius = 25;
    self.tapView.layer.borderWidth = 2;
    self.tapView.layer.borderColor = RGBCOLOR(215, 215, 215).CGColor;
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 50, 20)];
    [self.tapView addSubview:self.countLabel];
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.text = [NSString stringWithFormat:@"%ld", (self.bigNum+1)];
    self.countLabel.font = KFont(13);
    self.countLabel.textColor = RGBCOLOR(102, 102, 102);

    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(7, 25, 36, 1)];
    [self.tapView addSubview:line];
    line.backgroundColor = [UIColor blackColor];
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 50, 20)];
    [self.tapView addSubview:self.numLabel];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.text = [NSString stringWithFormat:@"%ld", self.totalSize];
    self.numLabel.font = KFont(13);
    self.numLabel.textColor = RGBCOLOR(102, 102, 102);

    self.tapImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.tapImageView.image = [UIImage imageNamed:@"goto_top"];
    self.tapImageView.backgroundColor = [UIColor whiteColor];
    [self.tapView addSubview:self.tapImageView];
}

- (void)gotoTopView:(UITapGestureRecognizer *)gesture {
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)registerClass {}
- (void)loadData {}
- (void)loadMore {}
- (void)beginRefresh {
    if (self.canTopRefresh) {
        [self.tableView.mj_header beginRefreshing];
    }
}

- (void)endRefresh {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
    if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
    }
    return _tableView;
}
#pragma mark - tableviewdelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"identifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return nil;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!self.ignorePage && self.totalSize > 0){
        NSInteger tempDisplay = indexPath.row;
        if(tempDisplay < self.smailNum){
            self.smailNum = tempDisplay;
        }else if(tempDisplay > self.smailNum && tempDisplay < self.bigNum){
            self.smailNum = tempDisplay;
        }else if(tempDisplay > self.bigNum){
            self.bigNum = tempDisplay;
        }
        if(self.totalSize < (self.bigNum + 1)){
            self.countLabel.text = [NSString stringWithFormat:@"%ld",(self.totalSize)];
        }else{
            self.countLabel.text = [NSString stringWithFormat:@"%ld",(self.bigNum+1)];
        }
    }
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(!self.ignorePage && self.totalSize > 0){
        NSInteger tempDisplay = indexPath.row;
        if(tempDisplay < self.smailNum){
            self.smailNum = tempDisplay;
        }else if(tempDisplay == self.smailNum){
            if(self.bigNum > tempDisplay + 1){
                self.smailNum  = tempDisplay + 1;
            }
        }else if(tempDisplay > self.smailNum && tempDisplay < self.bigNum){
            self.bigNum = tempDisplay;
        }else if(tempDisplay == self.bigNum){
            if(self.smailNum < tempDisplay - 1){
                self.bigNum  = tempDisplay - 1;
            }
        }else if(tempDisplay > self.bigNum){
            self.bigNum = tempDisplay;
        }
        if(self.totalSize < (self.bigNum + 1)){
            self.countLabel.text = [NSString stringWithFormat:@"%ld",(self.totalSize)];
        }else{
            self.countLabel.text = [NSString stringWithFormat:@"%ld",(self.bigNum+1)];
        }
    }
}
//按住显示与消失的效果
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if(!self.ignorePage){
        if(self.totalSize > 0){
            self.tapImageView.hidden = YES;
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(!self.ignorePage){
        self.tapImageView.hidden = NO;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.totalSize <= 0 && !self.ignorePage){//无元素，且没有获取页码，就不显示
        return;
    }
    NSIndexPath *indexT = [NSIndexPath indexPathForRow:self.bigNum inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexT];
    CGFloat heigitT = cell.frame.size.height;
    if (scrollView.contentOffset.y > (heigitT/10)) {
        self.tapView.hidden = (self.totalSize <= 0) ? YES : NO;
    }else{
        self.tapView.hidden = YES;
    }
}

- (void)setCanTopRefresh:(BOOL)canTopRefresh {
    _canTopRefresh = canTopRefresh;
    if (_canTopRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    } else {
        self.tableView.mj_header = nil;
    }
}

- (void)setCanBottomRefresh:(BOOL)canBottomRefresh {
    _canBottomRefresh = canBottomRefresh;
    if (_canBottomRefresh) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    } else {
        self.tableView.mj_footer = nil;
    }
}
- (void)setTotal:(NSInteger)total{
    self.totalSize = total;
    self.numLabel.text = [NSString stringWithFormat:@"%ld", total];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
