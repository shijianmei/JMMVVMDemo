//
//  LoginView.m
//  MvvmDemo
//
//  Created by Jianmei on 2019/11/7.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import "LoginView.h"
#import "LoginViewModel.h"
#import "UIView+Toast.h"

#define ScreenSize [UIScreen mainScreen].bounds.size
@interface LoginView ()
@property (strong, nonatomic)  UITextField *userNameTextField;
@property (strong, nonatomic)  UITextField *passWordTextField;
@property (strong, nonatomic)  UIButton *loginButton;
@property (strong, nonatomic)  UILabel *loginFailureLabel;

@end

@implementation LoginView

#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _userNameTextField.frame = CGRectMake(80, 110, ScreenSize.width - 160,40);
    _passWordTextField.frame = CGRectMake(80, CGRectGetMaxY(_userNameTextField.frame)+50, _userNameTextField.mj_w, 40);
    _loginButton.frame = CGRectMake(140, 110, ScreenSize.width - 280,40);
    _loginButton.mj_y = CGRectGetMaxY(_passWordTextField.frame) +40;
    _loginFailureLabel.frame = _loginButton.frame;
    _loginFailureLabel.mj_y = CGRectGetMaxY(_loginButton.frame) + 60;
    
}
#pragma mark - Private Fun

- (void)createSubViews {
        //用户名
    _userNameTextField = [[UITextField alloc]init];
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.layer.cornerRadius = 4;
    [self addSubview:_userNameTextField];
    
        //密码
    _passWordTextField = [[UITextField alloc]init];
    _passWordTextField.layer.cornerRadius = 4;
    _passWordTextField.placeholder = @"请输入密码";
    [self addSubview:_passWordTextField];
    
        //    //登录按钮
    _loginButton = [[UIButton alloc]init];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal ];
    _loginButton.enabled = NO;
    _loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _loginButton.layer.borderWidth = 1;
    _loginButton.layer.cornerRadius = 4;
    [_loginButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self addSubview:_loginButton];
    
        //    //状态lab
    _loginFailureLabel = [[UILabel alloc]init];
    _loginFailureLabel.text = @"无效的用户名或密码";
    _loginFailureLabel.textColor = [UIColor redColor];
    _loginFailureLabel.textAlignment = NSTextAlignmentCenter;
    _loginFailureLabel.hidden = YES;
    [self addSubview:_loginFailureLabel];
   
}

-(void)bindModel {
    
    RAC(self.viewModel, username) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passWordTextField.rac_textSignal;
    
    RAC(self.userNameTextField, backgroundColor) = [self.viewModel.usernameSignal map:^id(NSNumber *usernameValid) {
        return [usernameValid boolValue] ? [UIColor clearColor] : [UIColor redColor];
    }];
    RAC(self.passWordTextField, backgroundColor) = [self.viewModel.passwordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor redColor];
    }];
    
        // 注意：得到结果，是否正在执行. 是用两个个信号来分别表示，虽然麻烦些，但结构相当清晰
    @weakify(self);
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        BOOL success = [x boolValue];
        self.loginButton.enabled = YES;
        self.loginFailureLabel.hidden = success;
        [self bw_makeToast:@"登录失败!"];
        NSLog(@"登录失败");
            // 跳转一般写在控制器里
        if (success) {
//            [self goToLoginSuccessVC];
        }
    }];
    [[self.viewModel.loginCommand.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            NSLog(@"正在执行，显示loading");
        } else {
            NSLog(@"执行完成，隐藏loading");
        }
    }];
    [self.viewModel.connectionErrors subscribeNext:^(NSError *error) {
        NSLog(@"错误了，给个提示 error is %@",error);
    }];
    
        // 通常两种方法使用command
        // 一种方法是可以将button的rac_command属性赋值，此时能自动控制enable属性，按钮点击时就执行了
        //    self.loginButton.rac_command = self.viewModel.loginCommand;
        // 另一种方法是直接调用execute:方法，类似[loginCommand execute:@2]，此时还能传进去一个自己可控制的值
    RAC(self.loginButton, enabled) = self.viewModel.loginEnableSignal;
    
    [[[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
        @strongify(self);
//        [self.view endEditing:YES];
        self.loginButton.enabled = NO;
        self.loginFailureLabel.hidden = YES;
    }]
     subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:@2];
    }];
}

#pragma mark - event

#pragma mark - Getter Setter

-(void)setViewModel:(LoginViewModel *)viewModel {
    _viewModel = viewModel;
    [self bindModel];
}

@end
