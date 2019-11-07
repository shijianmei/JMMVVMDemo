//
//  JMListCollectionCellViewModel.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMListCollectionCellViewModel : NSObject
@property (nonatomic, copy) NSString *headerImageStr;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *articleNum;

@property (nonatomic, copy) NSString *peopleNum;

@property (nonatomic, copy) NSString *topicNum;

@property (nonatomic, copy) NSString *content;
@end
