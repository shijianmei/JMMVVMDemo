//
//  JMShoppingCartOrderListInfoModel.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMShoppingCartOrderListInfoModel : NSObject
@property(nonatomic,copy)NSString *orderid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *min_price;
@property(nonatomic,copy)NSString *praise_num;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *month_saled;
@property(nonatomic,copy)NSString *orderCount;

    /// 产品名称
@property (nonatomic,copy) NSString *productName;
    /// 原始价格
@property (nonatomic,copy) NSString *originalPrice;
@end

NS_ASSUME_NONNULL_END
