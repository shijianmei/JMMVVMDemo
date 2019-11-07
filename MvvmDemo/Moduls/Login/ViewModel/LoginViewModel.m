//
//  LoginViewModel.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    @weakify(self);
    self.usernameSignal = [[RACObserve(self, username)
                            map:^id(NSString *text) {
                                @strongify(self);
                                return @([self isValidUsername:text]);
                            }] distinctUntilChanged];
    self.passwordSignal = [[RACObserve(self, password)
                            map:^id(NSString *text) {
                                @strongify(self);
                                return @([self isValidPassword:text]);
                            }] distinctUntilChanged];
    self.loginEnableSignal = [RACSignal combineLatest:@[self.usernameSignal, self.passwordSignal]
                                               reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
                                                   return @([usernameValid boolValue] && [passwordValid boolValue]);
                                               }];
    self.loginCommand = [[RACCommand alloc] initWithEnabled:self.loginEnableSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self loginSignal];
    }];
    self.connectionErrors = self.loginCommand.errors;
}

- (RACSignal *)loginSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self loginWithUsername:self.username password:self.password complete:^(BOOL success) {
            [subscriber sendNext:@(success)];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 6;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 6;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(BOOL))loginResult {
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        BOOL success = [username isEqualToString:@"Username"] && [password isEqualToString:@"Password"];
        loginResult(success);
    });
}

@end
