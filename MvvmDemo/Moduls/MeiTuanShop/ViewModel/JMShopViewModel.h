//
//  JMShopViewModel.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMShopModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMShopViewModel : NSObject
@property (nonatomic, strong) JMShopModel *shopModel;

- (void)loadShopData ;

@end

NS_ASSUME_NONNULL_END
