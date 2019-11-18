//
//  JMEvaluateModel.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMEvaluateModel : NSObject

/**
 cell的缓存高度
 */
@property (nonatomic , assign) CGFloat  cellHeight;

@property (nonatomic , copy) NSString *content;
@property (nonatomic , copy) NSString *evaluateType;
@property (nonatomic , copy) NSString *healthScore;
@property (nonatomic , copy) NSString *locationScore;
@property (nonatomic , copy) NSString *memberHeadUrl;
@property (nonatomic , copy) NSString *memberId;
@property (nonatomic , copy) NSString *memberName;
@property (nonatomic , copy) NSString *performanceScore;
@property (nonatomic , copy) NSString *replyContent;
@property (nonatomic , copy) NSString *roomTypeName;
@property (nonatomic , copy) NSString *serviceScore;
@property (nonatomic , copy) NSString *totalScore;
@property (nonatomic , strong) NSArray <NSDictionary *>*picList;
@property (nonatomic , copy) NSString *commTime;
@property (nonatomic , copy) NSString *regular;
@property (nonatomic , copy) NSString *commContent;

#pragma mark ---房型
/**房型名称*/
@property (nonatomic , copy) NSString *name;
/**房型类型id*/
@property (nonatomic , copy) NSString *iD;
/**是否被选中*/
@property (nonatomic , assign) BOOL isSelected;

    //@property (nonatomic , strong) NSArray <RoomPriceModel >*roomPriceList;

- (void)calculateCellHeightWithDic:(NSDictionary *)dic;

- (void)calculateCellHeight;
    //计算生活预约评价cell高度
- (void)calculateReserveCellHeight;
#pragma mark - 计算外卖店铺主页评价cell的高度
- (void)calculateTakeawayEvaluateCellHeight;
@end

NS_ASSUME_NONNULL_END
