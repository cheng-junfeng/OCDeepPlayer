//
//  MineTableHeader.m
//  OCDeepPlayer
//
//  Created by wutos on 2019/3/20.
//  Copyright © 2019年 wutos. All rights reserved.
//

#import "MineTableHeader.h"
@interface MineTableHeader ()
@property (nonatomic, strong) UIImageView *header;
@end
@implementation MineTableHeader


+ (instancetype)initHeaderViewWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"MineTableHeader";
    MineTableHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (header == nil) {
        header = [[MineTableHeader alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *colorView = [[UIView alloc] init];
        [colorView setFrame:CGRectMake(0, 0,
                                       kScreenWidth, MineHeader_H)];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = colorView.bounds;
        gradient.colors = [NSArray arrayWithObjects:
                           (id)RGBCOLOR(131, 105, 81).CGColor,
                           (id)RGBCOLOR(186, 161, 121).CGColor,
                           (id)RGBCOLOR(186, 161, 121).CGColor, nil];
        [colorView.layer addSublayer:gradient];
        self.backgroundView = colorView;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self.contentView addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}
- (UIImageView *)header {
    if (!_header) {
        _header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _header;
}
@end
