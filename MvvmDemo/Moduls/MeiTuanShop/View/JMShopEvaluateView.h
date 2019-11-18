//
//  JMShopEvaluateView.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/14.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMEvaluateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMShopEvaluateView : UIView
@property (nonatomic , strong) UITableView *tableView;

    //店铺ID
@property (nonatomic , copy) NSString *groupId;

- (id)initWithFrame:(CGRect)frame  withGroupID:(NSString *)groupId;
@end

NS_ASSUME_NONNULL_END
