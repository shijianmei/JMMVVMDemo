//
//  LoginView.h
//  MvvmDemo
//
//  Created by Jianmei on 2019/11/7.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LoginViewModel;

@interface LoginView : UIView
@property (nonatomic, strong)  LoginViewModel *viewModel;

@property (nonatomic, copy)  void(^loginCompletion)(id result);

@end

NS_ASSUME_NONNULL_END
