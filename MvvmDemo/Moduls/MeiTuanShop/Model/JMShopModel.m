//
//  JMShopModel.m
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import "JMShopModel.h"

@implementation JMShopModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"couponList" : [JMCouponListModel class],
        @"activityList" : [JMCouponListModel class]             
    };
}
@end

@implementation JMCouponListModel

@end
