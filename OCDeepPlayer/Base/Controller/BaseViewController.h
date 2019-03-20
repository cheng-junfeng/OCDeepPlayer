//
//  BaseViewController.h
//  ZEBBaseProject
//
//  Created by zm4 on 2018/7/3.
//  Copyright © 2018年 zm4. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlankPageView;
@interface BaseViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *dataSource;

@property(nonatomic) BOOL blankPage;
@property(nonatomic) BOOL canTopRefresh;
@property(nonatomic) BOOL canBottomRefresh;
@property(nonatomic) BOOL ignoreTap;
@property(nonatomic) BOOL ignorePage;
@property(nonatomic) NSInteger smailNum;
@property(nonatomic) NSInteger bigNum;
@property(nonatomic) PADDING_H paddingHeight;
@property (nonatomic, strong) UIView *tapView;
@property (nonatomic, strong) UIImageView *tapImageView;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong)BlankPageView *noDataView;
@property(nonatomic) NSInteger totalSize;
+ (NSString *)identifier;

- (void)registerClass;
- (void)initNotification;

- (void)loadData;
- (void)loadMore;

- (void)endRefresh;
- (void)beginRefresh;

- (void)setTotal:(NSInteger)total;
@end
