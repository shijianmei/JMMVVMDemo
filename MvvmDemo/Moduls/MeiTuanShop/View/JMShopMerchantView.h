//
//  JMShopMerchantView.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMShopModel;
NS_ASSUME_NONNULL_BEGIN

@interface JMShopMerchantView : UIView
@property (nonatomic , strong) UITableView *tableView;

    //店铺ID
@property (nonatomic , copy) NSString *groupId;

@property (nonatomic ,strong) JMShopModel *shopModel;//数据模型

@end

NS_ASSUME_NONNULL_END
