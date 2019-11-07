//
//  JMListHeaderViewModel.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "JMListHeaderViewModel.h"

@implementation JMListHeaderViewModel


- (NSArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [[NSArray alloc] init];
    }
    
    return _dataArray;
}

- (RACSubject *)refreshUISubject {
    
    if (!_refreshUISubject) {
        
        _refreshUISubject = [RACSubject subject];
    }
    
    return _refreshUISubject;
}

- (RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
        
        _cellClickSubject = [RACSubject subject];
    }
    
    return _cellClickSubject;
}

@end
