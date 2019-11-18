//
//  JMOtherViewController.m
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/18.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import "JMOtherViewController.h"

@interface JMOtherViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView          *imageView;
@property (nonatomic, strong) UIAttachmentBehavior *attachement;
@property (nonatomic, strong) UIDynamicAnimator    *animator;
@end

@implementation JMOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * img = [UIImageView new];
    img.image = [UIImage imageNamed:@"food"];
    [self.view addSubview:img];
    img.frame = CGRectMake(100, 100, 200, 200);
    self.imageView = img;
        // 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    img.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:pan];
    
        // 1. 实例化Animator
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
        //获取偏移量
        // 返回的是相对于最原始的手指的偏移量
    CGPoint transP = [pan translationInView:self.imageView];
        // 移动图片控件
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x, transP.y);

        //保证每次只是移动的距离，不是从头一直移动的距离
    [pan setTranslation:CGPointZero inView:self.imageView];
}

@end
