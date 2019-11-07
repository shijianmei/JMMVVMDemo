//
//  JMListViewController.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "JMListViewController.h"
#import "JMListView.h"
#import "JMListViewModel.h"
#import "HomeViewController.h"


@interface JMListViewController ()
@property (nonatomic, strong) JMListView *mainView;

@property (nonatomic, strong) JMListViewModel *viewModel;

@end

@implementation JMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [JMListViewModel new];

    [self ConfigView];
    [self bindViewModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ConfigView
{
    _mainView = [[JMListView alloc] initWithViewModel:self.viewModel];
    [self.view addSubview:_mainView];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)bindViewModel
{
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        
        @strongify(self);
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }];
}

@end
