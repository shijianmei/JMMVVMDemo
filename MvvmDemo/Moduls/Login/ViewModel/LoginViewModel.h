//
//  LoginViewModel.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject
// property
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

// signal
@property (nonatomic, strong) RACSignal *usernameSignal;
@property (nonatomic, strong) RACSignal *passwordSignal;
@property (nonatomic, strong) RACSignal *loginEnableSignal;
@property (nonatomic, strong) RACSignal *connectionErrors;

// command
@property (nonatomic, strong) RACCommand *loginCommand;
@end
