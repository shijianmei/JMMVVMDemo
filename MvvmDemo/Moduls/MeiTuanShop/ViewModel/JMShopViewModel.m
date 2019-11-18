//
//  JMShopViewModel.m
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import "JMShopViewModel.h"
#import <YYModel/NSObject+YYModel.h>

@implementation JMShopViewModel

- (void)loadShopData {
    
    NSDictionary *dataDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shop.json" ofType:nil]];
    self.shopModel = [JMShopModel yy_modelWithJSON:dataDict];
    
}
@end
