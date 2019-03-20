//
//  MineTableViewCell.m
//  OCDeepPlayer
//
//  Created by wutos on 2019/3/20.
//  Copyright © 2019年 wutos. All rights reserved.
//

#import "MineTableViewCell.h"
@interface MineTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *secondLabel;

@property (nonatomic, strong) UILabel *line;

@end
@implementation MineTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.line];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(20);
    }];
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.2);
    }];
}

- (void)configCellWithIcon:(NSString *)content title:(NSString *)title {
    self.titleLabel.text = title;
    self.secondLabel.text = content;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [ZEBUI createLabelWithbackGroundColor:nil textAlignment:NSTextAlignmentLeft font:KFont(15) textColor:[UIColor blackColor] text:@"版本"];
    }
    return _titleLabel;
}
- (UILabel *)secondLabel {
    if (!_secondLabel) {
        _secondLabel = [ZEBUI createLabelWithbackGroundColor:nil textAlignment:NSTextAlignmentLeft font:KFont(13) textColor:RGBCOLOR(115, 115, 115) text:@"V1.0.1"];
    }
    return _secondLabel;
}
- (UILabel *)line {
    if (!_line) {
        _line = [[UILabel alloc] init];
        _line.backgroundColor =RGBCOLOR(237, 237, 237);
    }
    return _line;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
