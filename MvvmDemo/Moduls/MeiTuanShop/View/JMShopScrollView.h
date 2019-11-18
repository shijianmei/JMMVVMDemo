//
//  JMShopScrollView.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMShopModel;

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ShopModuleType) {
    ShopModuleTypeList = 1,   //样式一 列表布局
    ShopModuleTypeGongGe  = 2,  //样式二 宫格布局
    ShopModuleTypeCard        //样式三 卡片布局
};
@protocol JMShopScrollViewDelegate;

@interface JMShopScrollView : UIScrollView

    //是否显示动画;
@property (nonatomic ,assign) BOOL isStopAnimation;
    //商家展示风格类型
@property (nonatomic ,assign) ShopModuleType shopViewType;
    //申明代理
@property (weak , nonatomic) id<JMShopScrollViewDelegate> scrollDelegate;
    //店铺ID
@property (nonatomic , copy) NSString *groupId;
    //当前视图控制器
@property (nonatomic , strong) UIViewController *currentVC;
    //初始化店铺主页方法
- (id)initWithFrame:(CGRect)frame  withShopModel:(JMShopModel *)model  withGroupID:(NSString *)groupId currentVC:(UIViewController *)currentVC;

    //移除手势
- (void)removeBehaviors;
@end

@protocol JMShopScrollViewDelegate <NSObject>

@optional

    //监听列表滚动视图的偏移量
- (void)ListScrollViewDidScroll:(UIScrollView *)scrollView;

    //偏移结束后
- (void)ListScrollViewDidEndDragging:(UIScrollView *)scrollView;

    //点击顶部视图  让该视图平移向下消失
- (void)ListScrollViewDropDown:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
