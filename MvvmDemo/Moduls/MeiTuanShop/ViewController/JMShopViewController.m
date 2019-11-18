//
//  JMShopViewController.m
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/12.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import "JMShopViewController.h"
#import "JMShopView.h"
#import "JMShopViewModel.h"

@interface JMShopViewController ()
@property (nonatomic, strong) JMShopView *shopView;
@property (nonatomic, strong) JMShopViewModel *viewModel;
@end

@implementation JMShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    [self configView];
    [self BindViewModel];
    [self reqestData];
}
#pragma mark - private Fun

- (void)configView {
    [self.view addSubview:self.shopView];
    self.shopView.frame = self.view.bounds;
}

- (void)BindViewModel {
    RAC(self.shopView, shopModel) = [RACObserve(self.viewModel, shopModel) skip:1];
}

- (void)reqestData {
    [self.viewModel loadShopData];
}
#pragma mark - Getter or Setter
- (JMShopView *)shopView {
    if (!_shopView) {
        _shopView = [[JMShopView alloc]init];
    }
    return _shopView;
}

- (JMShopViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[JMShopViewModel alloc]init];
    }
    return _viewModel;
}

@end
