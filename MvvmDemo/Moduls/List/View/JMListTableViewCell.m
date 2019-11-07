//
//  JMListTableViewCell.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "JMListTableViewCell.h"

@interface JMListTableViewCell()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *articleImageView;

@property (nonatomic, strong) UILabel *articleLabel;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UILabel *peopleNumLabel;


@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *lineImageView;
@end
@implementation JMListTableViewCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)yd_setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.articleImageView];
    [self.contentView addSubview:self.articleLabel];
    [self.contentView addSubview:self.peopleImageView];
    [self.contentView addSubview:self.peopleNumLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.lineImageView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints {
    
    
    
    CGFloat paddingEdge = 10;
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(paddingEdge);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headerImageView.mas_right).offset(paddingEdge);
        make.top.mas_equalTo(self.headerImageView);
        make.right.mas_equalTo(-paddingEdge);
        make.height.mas_equalTo(15);
    }];
    
    [self.articleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.nameLabel);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(paddingEdge);
    }];
    
    [self.articleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.articleImageView.mas_right).offset(3);
        make.size.mas_equalTo(CGSizeMake(50, 15));
        make.centerY.mas_equalTo(self.articleImageView);
    }];
    
    [self.peopleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.articleLabel.mas_right).offset(paddingEdge);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.mas_equalTo(self.articleImageView);
    }];
    
    [self.peopleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.peopleImageView.mas_right).offset(3);
        make.centerY.mas_equalTo(self.peopleImageView);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.articleImageView.mas_bottom).offset(paddingEdge);
        make.left.mas_equalTo(self.articleImageView);
        make.right.mas_equalTo(-paddingEdge);
        make.height.mas_equalTo(15);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1.0);
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
    self.articleLabel.text = viewModel.articleNum;
    self.peopleNumLabel.text = viewModel.peopleNum;
    self.contentLabel.text = viewModel.content;
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
        _nameLabel.textColor = MAIN_BLACK_TEXT_COLOR;
        _nameLabel.font = SYSTEMFONT(14);
    }
    
    return _nameLabel;
}

- (UIImageView *)articleImageView {
    
    if (!_articleImageView) {
        
        _articleImageView = [[UIImageView alloc] init];
        _articleImageView.backgroundColor = red_color;
    }
    
    return _articleImageView;
}

- (UILabel *)articleLabel {
    
    if (!_articleLabel) {
        
        _articleLabel = [[UILabel alloc] init];
        _articleLabel.textColor = MAIN_LINE_COLOR;
        _articleLabel.font = SYSTEMFONT(12);
    }
    
    return _articleLabel;
}

- (UIImageView *)peopleImageView {
    
    if (!_peopleImageView) {
        
        _peopleImageView = [[UIImageView alloc] init];
        _peopleImageView.backgroundColor = red_color;
    }
    
    return _peopleImageView;
}

- (UILabel *)peopleNumLabel {
    
    if (!_peopleNumLabel) {
        
        _peopleNumLabel = [[UILabel alloc] init];
        _peopleNumLabel.textColor = MAIN_LINE_COLOR;
        _peopleNumLabel.font = SYSTEMFONT(12);
    }
    
    return _peopleNumLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = MAIN_BLACK_TEXT_COLOR;
        _contentLabel.font = SYSTEMFONT(14);
    }
    
    return _contentLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = MAIN_LINE_COLOR;
    }
    
    return _lineImageView;
}
@end
