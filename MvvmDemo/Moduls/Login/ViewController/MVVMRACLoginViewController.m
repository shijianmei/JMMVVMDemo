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
#import "LoginView.h"

#define ScreenSize [UIScreen mainScreen].bounds.size
@interface MVVMRACLoginViewController ()
@property (nonatomic, strong) LoginView *LoginView;
@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation MVVMRACLoginViewController
#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM+RAC Login";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createSubViews];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (void)createSubViews {
    self.LoginView.frame = self.view.bounds;
    [self.view addSubview:self.LoginView];
    @weakify(self);
    self.LoginView.loginCompletion = ^(id  _Nonnull result) {
        @strongify(self);
        [self goToLoginSuccessVC];
    };
}

-(void)goToLoginSuccessVC {
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:homeVc animated:YES];
}

#pragma mark - Getter Setter
- (LoginView *)LoginView {
    if (!_LoginView) {
        _LoginView = [[LoginView alloc]init];
        _LoginView.viewModel = self.viewModel;
    }
    return _LoginView;
}

- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc]init];
    }
    return _viewModel;
}

@end
