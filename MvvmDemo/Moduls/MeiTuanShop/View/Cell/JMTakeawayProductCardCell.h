//
//  JMTakeawayProductCardCell.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMTakeawayProductCardCell : UITableViewCell

    /// 产品图
@property (nonatomic,strong) UIImageView *productImgView;
    /// 产品标题
@property (nonatomic,strong) UILabel *productNameLabel;
    /// 月售
@property (nonatomic,strong) UILabel *monthlySaleLabel;
    /// 赞
@property (nonatomic,strong) UILabel *fabulousCountLabel;
    /// 价格
@property (nonatomic,strong) UILabel *priceLabel;
    /// 辣度背景
@property (nonatomic,strong) UIView *spicypBgView;
    /// 原价
@property (nonatomic,strong) UILabel *originalPriceLabel;
    /// 折扣
@property (nonatomic,strong) UILabel *discountLabel;

    /// 网友最爱，新品等产品类型
@property (nonatomic,strong) UIImageView *classImgView;

@property (nonatomic,strong) UIView *lineView;

    /// 添加按钮
@property (nonatomic,strong) UIButton *addBT;
    /// 数量
@property (nonatomic,strong) UILabel *countLab;
    /// 减少按钮
@property (nonatomic,strong) UIButton *reduceBT;
    /// 选规格
@property (nonatomic,strong) UIButton *specificationBT;
    /// 售罄 or  非可售时间
@property (nonatomic,strong) UILabel *sellOutLab;
    /// ⚠️图标
@property (nonatomic,strong) UIImageView *warningIcon;
@end

NS_ASSUME_NONNULL_END
