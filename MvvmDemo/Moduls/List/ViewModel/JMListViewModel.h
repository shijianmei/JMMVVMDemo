//
//  JMListViewModel.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMListHeaderViewModel.h"
#import "JMListSectionHeaderViewModel.h"


@interface JMListViewModel : NSObject


@property (nonatomic, strong) RACSubject *refreshEndSubject;

@property (nonatomic, strong) RACSubject *refreshUI;

@property (nonatomic, strong) RACCommand *refreshDataCommand;

@property (nonatomic, strong) RACCommand *nextPageCommand;

@property (nonatomic, strong) JMListHeaderViewModel *listHeaderViewModel;

@property (nonatomic, strong) JMListSectionHeaderViewModel *sectionHeaderViewModel;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) RACSubject *cellClickSubject;
@end
