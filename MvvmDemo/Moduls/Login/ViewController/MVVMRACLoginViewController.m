//
//  MVVMRACLoginViewController.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "MVVMRACLoginViewController.h"
#import "LoginViewModel.h"
#import "HomeViewController.h"

#define ScreenSize [UIScreen mainScreen].bounds.size
@interface MVVMRACLoginViewController ()
@property (strong, nonatomic)  UITextField *userNameTextField;
@property (strong, nonatomic)  UITextField *passWordTextField;
@property (strong, nonatomic)  UIButton *loginButton;
@property (strong, nonatomic)  UILabel *loginFailureLabel;
@property (nonatomic, strong)  LoginViewModel *viewModel;

@end

@implementation MVVMRACLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM+RAC Login";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configView];
    [self bindModel];
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

-(void)configView
{
    //用户名
    _userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 110, ScreenSize.width - 80,40)];
    _userNameTextField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_userNameTextField];
    
    //密码
    _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(_userNameTextField.frame)+50, _userNameTextField.mj_w, 40)];
    _passWordTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_passWordTextField];
    
    //    //登录按钮
    _loginButton = [[UIButton alloc]init];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal ];
    _loginButton.enabled = NO;
    [_loginButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    _loginButton.frame = _passWordTextField.frame;
    _loginButton.mj_y = CGRectGetMaxY(_passWordTextField.frame) +60;
    
    //    //状态lab
    _loginFailureLabel = [[UILabel alloc]init];
    _loginFailureLabel.text = @"无效的用户名或密码";
    _loginFailureLabel.textColor = [UIColor redColor];
    _loginFailureLabel.textAlignment = NSTextAlignmentCenter;
    _loginFailureLabel.hidden = YES;
    [self.view addSubview:_loginFailureLabel];
    _loginFailureLabel.frame = _loginButton.frame;
    _loginFailureLabel.mj_y = CGRectGetMaxY(_loginButton.frame) + 60;
}

-(void)bindModel
{
    self.viewModel = [[LoginViewModel alloc] init];
    
    RAC(self.viewModel, username) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passWordTextField.rac_textSignal;
    
    // 应用宏定义控制控件的UI
    RAC(self.userNameTextField, backgroundColor) = [self.viewModel.usernameSignal map:^id(NSNumber *usernameValid) {
        return [usernameValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    RAC(self.passWordTextField, backgroundColor) = [self.viewModel.passwordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    
    // 注意：得到结果，是否正在执行. 是用两个个信号来分别表示，虽然麻烦些，但结构相当清晰
    @weakify(self);

    
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        BOOL success = [x boolValue];
        self.loginButton.enabled = YES;
        self.loginFailureLabel.hidden = success;
        // 跳转一般写在控制器里
        if (success) {
            [self goToLoginSuccessVC];
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
          [self.view endEditing:YES];
          self.loginButton.enabled = NO;
          self.loginFailureLabel.hidden = YES;
      }]
     subscribeNext:^(id x) {
         @strongify(self);
         [self.viewModel.loginCommand execute:@2];
     }];
}

-(void)goToLoginSuccessVC
{
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:homeVc animated:YES];
}
@end
