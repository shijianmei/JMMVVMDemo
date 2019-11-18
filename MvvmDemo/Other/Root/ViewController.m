//
//  ViewController.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "ViewController.h"
#import "MVVMRACLoginViewController.h"
#import "JMListViewController.h"
#import "JMShopViewController.h"
#import "JMOtherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)init
{
    if (self = [super init]) {
//        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    [btn setTitle:@"调到登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        MVVMRACLoginViewController *vc = [[MVVMRACLoginViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 240, 120, 40)];
    [btn1 setTitle:@"美团外卖商铺" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [[btn1 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        JMShopViewController *vc = [[JMShopViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 340, 120, 40)];
    [btn2 setTitle:@"测试3" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [[btn2 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        JMOtherViewController *vc = [[JMOtherViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
