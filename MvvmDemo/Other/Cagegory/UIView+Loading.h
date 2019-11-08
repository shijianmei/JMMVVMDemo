//
//  UIView+Loading.h
//  MMCApp
//
//  Created by yuanzc on 2018/7/20.
//  Copyright © 2018 yuanzc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMCLoadingStyle) {
    MMCLoadingStyleDefaule,
    MMCLoadingStyleGradient
};
@class MMCCircleView;
@interface MMCLoadingView :UIView

@property (nonatomic, copy) NSString *loadingText;
@property (nonatomic, strong)UIView *backView;//遮罩层
@property (nonatomic, strong)UIView *contentView;

    /// 是否让底层视图响应 YES 响应 NO 不响应  默认 NO 不响应
@property (nonatomic, assign) BOOL isCanTouchNextView;
    /// 是否暴露导航 YES 暴露 NO 不暴露
@property (assign, nonatomic) BOOL isNotMask;
/**
 是否有遮罩层
 */
@property (assign, nonatomic) BOOL isBodyMask;

@property (nonatomic, strong) MMCCircleView *circleView;
@end

// TODO:有需要可以进一步封装
@interface UIView (Loading)

/**
 默认不允许用户有操作,但可操作导航栏
 */
- (void)bw_showLoad;

/**
 默认不允许用户有操作,但可操作导航栏
 @param text text
 */
- (void)bw_showLoadingWithText:(NSString *)text;

/**
 全屏展示,
 */
- (void)bw_showLoadingFullScreen;

/**
 全屏展示, 带文字
 */
- (void)bw_showLoadingFullScreenWithText:(NSString *)text;

/**
 默认不允许用户有操作,也不可操作导航栏
 带遮罩层
 @param text text
 */
- (void)bw_showMaskedLoadingWithText:(NSString *)text;

/**
 活动图

 @param text 文本
 @param isCanTouchNextView 是否让底层视图响应 YES 响应 NO 不响应  默认 NO 不响应
 @param isNotMask /// 是否暴露导航 YES 暴露 NO 不暴露

 */
- (void)bw_showLoadingWithText:(NSString *)text isCanTouchNextView:(BOOL)isCanTouchNextView isNotMask:(BOOL)isNotMask;

//- (void)showGradientLoading;

- (void)bw_hiddenLoading;

@end
