//
//  JMListSectionHeaderViewModel.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMListSectionHeaderViewModel : NSObject
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) RACSubject *refreshUISubject;

@property (nonatomic, strong) RACSubject *cellClickSubject;
@end
