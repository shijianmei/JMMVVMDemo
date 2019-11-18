//
//  JMReserveEvluateCell.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMEvaluateModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ReserveEvluateCellDelegate;

@interface JMReserveEvluateCell : UITableViewCell

/**
 头像
 */
@property (nonatomic , strong) UIImageView *headImgView;
/**
 用户名称
 */
@property (nonatomic , strong) UILabel *userNameLab;
/**
 评论时间
 */
@property (nonatomic , strong) UILabel *timeLab;
/**
 酒店套房类型
 */
@property (nonatomic , strong) UILabel *roomTypeLab;
/**
 评价分数
 */
@property (nonatomic , strong) UILabel *gradeLab;
/**
 评论内容
 */
@property (nonatomic , strong) UILabel *contentLab;
/**
 图片视图
 */
@property (nonatomic , strong) UIView *photoView;
/**
 图标
 */
@property (nonatomic , strong) UIImageView *topImgView;

/**
 酒店回复视图
 */
@property (nonatomic , strong) UIView *replyView;
/**
 酒店回复
 */
@property (nonatomic , strong) UILabel *replyLab;
/**
 底部的线
 */
@property (nonatomic , strong) UILabel *lineLab;

@property (nonatomic , weak) id <ReserveEvluateCellDelegate >delegate;

@property (nonatomic , strong)JMEvaluateModel *model;

/**
 1:代表店铺优化的评价
 */
@property (nonatomic , assign) NSInteger cellType;

@end


@protocol ReserveEvluateCellDelegate <NSObject>

@optional

- (void)didSelectedPhotoView:(JMReserveEvluateCell *)cell withImgIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
