//
//  JMViewModelProtocol.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    HeaderRefresh_HasMoreData = 1,
    HeaderRefresh_HasNoMoreData,
    FooterRefresh_HasMoreData,
    FooterRefresh_HasNoMoreData,
    RefreshError,
    RefreshUI,
} JMRefreshDataStatus;

@protocol JMViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;
@end


@protocol JMViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <JMViewModelProtocol>)viewModel;

- (void)yd_bindViewModel;
- (void)yd_setupViews;
- (void)yd_addReturnKeyBoard;

@end
