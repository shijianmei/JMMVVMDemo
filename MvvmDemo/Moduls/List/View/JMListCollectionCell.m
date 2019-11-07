//
//  JMListCollectionCell.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "JMListCollectionCell.h"
@interface JMListCollectionCell ()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end
@implementation JMListCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints {
    
    
    CGFloat paddingEdge = 10;
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(paddingEdge);
        make.height.mas_equalTo(15);
        make.left.right.mas_equalTo(self.headerImageView);
    }];
    
    [super updateConstraints];
}

- (void)setViewModel:(JMListCollectionCellViewModel *)viewModel {
    
    if (!viewModel) {
        
        return;
    }
    
    _viewModel = viewModel;
    
    [self.headerImageView sd_setImageWithURL:URL(viewModel.headerImageStr) placeholderImage:ImageNamed(@"yc_circle_placeHolder.png")];
    self.nameLabel.text = viewModel.name;
}

- (void)setType:(NSString *)type {
    
    self.headerImageView.image = ImageNamed(@"circle_plus.png");
    self.nameLabel.text = @"加入新圈子";
}

#pragma mark - lazyLoad
- (UIImageView *)headerImageView {
    
    if (!_headerImageView) {
        
        _headerImageView = [[UIImageView alloc] init];
    }
    
    return _headerImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = SYSTEMFONT(12);
        _nameLabel.textColor = MAIN_LINE_COLOR;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}
@end
