//
//  UIView+Loading.m
//  MMCApp
//
//  Created by yuanzc on 2018/7/20.
//  Copyright © 2018 yuanzc. All rights reserved.
//

#import <objc/runtime.h>

//#import "MMCGlobelConstants.h"
#import "UIView+Loading.h"

@interface MMCCircleView : UIView

// 前面圆弧的颜色
@property (nonatomic, strong) UIColor *circleColor;

// 后面圆圈的颜色
@property (nonatomic, strong) UIColor *circleBackgroundColor;

// 如果有文字,需要展示的文字
@property (nonatomic, copy) NSString *loadingText;

// 圆圈宽度
@property (nonatomic, assign) CGFloat lineWidth;

// 半径
@property (nonatomic, assign) CGFloat radius;



@property (nonatomic, strong) UIImageView *animationView;

@end

@implementation MMCCircleView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.animationView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.frame.size;
    self.animationView.frame = CGRectMake(0, 0, size.width, size.height);
}

#pragma mark - Animation
- (void)startRefreshAnimation {
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [CATransaction commit];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2*M_PI];
    rotationAnimation.duration = 0.8;
    rotationAnimation.cumulative = NO;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.animationView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopRefreshAnimation {
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [CATransaction commit];
    
    [self.animationView.layer removeAllAnimations];
}


#pragma mark - Setter

- (UIImageView*) animationView {
    if (_animationView == nil) {
        _animationView = [[UIImageView alloc] init];
        _animationView.image = [UIImage imageNamed:@"bw_refresh2"];
    }
    return _animationView;
}

@end

#define kTopOffset 15.0


@interface MMCLoadingView()
@property (nonatomic, strong) UILabel *loadingTextLabel;

@end

@implementation MMCLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        [self addSubview:self.circleView];
        [self addSubview:self.loadingTextLabel];
        [self.circleView startRefreshAnimation];
    }
    
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isResponse = [super pointInside:point withEvent:event];
    if (_isCanTouchNextView) {
        if ( (!_isNotMask && CGRectContainsPoint(CGRectMake(0, 0, self.frame.size.width, UI_NAVIGATION_BAR_HEIGHT), point))) {
            isResponse = YES;
        }
        else {
            isResponse = NO;
        }
    }
    if (_isNotMask) {
        if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, UI_NAVIGATION_BAR_HEIGHT), point)) {
            return NO;
        }
    }
    
    return isResponse;
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat diameter = self.circleView.radius * 2 ;
    if (self.loadingText.length) {
        
        CGRect rect = [self.loadingText boundingRectWithSize:CGSizeMake(self.frame.size.width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.loadingTextLabel.font} context:nil];
        if (rect.size.height > 25.0) {
            CGPoint center = self.center;
            self.frame = CGRectMake(0, 0, 140, 140);
            self.center = center;
            
            CGRect circleViewFrame = CGRectMake(self.frame.size.width/2.0 - self.circleView.radius, 20.0, diameter, diameter);
            self.circleView.frame = circleViewFrame;
            
            CGRect loadingTextLabelFrame = CGRectMake(5, kTopOffset + diameter, self.frame.size.width - 10.0, self.frame.size.height - (kTopOffset + diameter));
            self.loadingTextLabel.frame = loadingTextLabelFrame;
            self.loadingTextLabel.hidden = NO;
            self.loadingTextLabel.text = self.loadingText;
            
        } else {
            CGRect circleViewFrame = CGRectMake(self.frame.size.width/2.0 - self.circleView.radius, kTopOffset, diameter, diameter);
            self.circleView.frame = circleViewFrame;
            
            CGRect loadingTextLabelFrame = CGRectMake(0, kTopOffset + diameter, self.frame.size.width, self.frame.size.height - (kTopOffset + diameter));
            self.loadingTextLabel.frame = loadingTextLabelFrame;
            self.loadingTextLabel.hidden = NO;
            self.loadingTextLabel.text = self.loadingText;
        }
    } else {
        CGRect circleViewFrame = CGRectMake(self.frame.size.width/2.0 - diameter/2.0 , self.frame.size.height/2.0 - diameter/2.0, diameter, diameter);
        self.circleView.frame = circleViewFrame;
        
        self.loadingTextLabel.hidden = YES;
    }
}


#pragma mark - Setter

-(void)setIsBodyMask:(BOOL)isBodyMask
{
    _isBodyMask = isBodyMask;
    _isNotMask = NO;
    self.backView.backgroundColor = isBodyMask ? [UIColor colorWithRed:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f alpha: 0.3] : [UIColor clearColor];
}

- (void)setLoadingText:(NSString *)loadingText {
    if (_loadingText != loadingText) {
        _loadingText = loadingText;
    }
    
    [self layoutIfNeeded];
}

#pragma mark - Getter

- (MMCCircleView *)circleView {
    if (!_circleView) {
        _circleView = [[MMCCircleView alloc] initWithFrame:CGRectZero];
        _circleView.radius = 14.0;
    }
    
    return _circleView;
}

- (UILabel *)loadingTextLabel {
    if (!_loadingTextLabel) {
        _loadingTextLabel = [[UILabel alloc] init];
        _loadingTextLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat scale = [UIScreen mainScreen].bounds.size.width / 375.0f;
        _loadingTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14.0f * scale];
        _loadingTextLabel.numberOfLines = 0;
        _loadingTextLabel.textColor = [UIColor colorWithRed:((float)((0xffffff & 0xFF0000) >> 16))/255.0
                                                      green:((float)((0xffffff & 0xFF00) >> 8))/255.0
                                                       blue:((float)(0xffffff & 0xFF))/255.0 alpha:1.0];
        _loadingTextLabel.hidden = YES;
        [_loadingTextLabel sizeToFit];
    }
    
    return _loadingTextLabel;
}

@end

static NSString *kLoadingViewKey  = @"LoadingViewKey";
static NSString *kOverlayViewKey  = @"OverlayViewKey";
static NSString *kLoadingViewShowingKey  = @"LoadingViewShowingKey";

@interface UIView()

@property (nonatomic, strong) MMCLoadingView *loadingView;

@property (nonatomic, strong) UIView *overlayView;

@property (nonatomic, assign) BOOL showing;

@end

@implementation UIView (Loading)

- (void)bw_showLoad {
    [self bw_showLoadingWithText:nil];
}

- (void)bw_showLoadingWithText:(NSString *)text {
    if (!self.showing) {
        self.showing = YES;
        self.loadingView.loadingText = text;
        //设置属性暴露导航栏
        self.loadingView.isNotMask = YES;
        CGPoint loadingPoint = self.loadingView.center;
        if ([self.nextResponder isKindOfClass:[UIViewController class]]) {
            UIViewController *controller = (UIViewController *)self.nextResponder;
            if (!controller.navigationController.navigationBar.hidden) {
                loadingPoint.y -= UI_NAVIGATION_BAR_HEIGHT;
                self.overlayView.frame = CGRectMake(0, UI_NAVIGATION_BAR_HEIGHT, self.bounds.size.width, self.bounds.size.height);
            } else if (!controller.tabBarController.tabBar.hidden){
                loadingPoint.y += UI_TABBAR_HEIGHT / 2.0;
                self.overlayView.frame = CGRectMake(0, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
            }
        }
        
        [self addSubview:self.overlayView];
        self.loadingView.center = loadingPoint;
        [self addSubview:self.loadingView];
    }
}

- (void)bw_showLoadingFullScreen {
    [self bw_showLoadingFullScreenWithText:nil];
}

- (void)bw_showLoadingFullScreenWithText:(NSString *)text {
    if (!self.showing) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self.overlayView];
        
        self.loadingView.loadingText = text;
        [self.overlayView addSubview:self.loadingView];
    }
}

- (void)bw_showMaskedLoadingWithText:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.loadingView.loadingText = text;
    self.loadingView.isBodyMask = YES;
    [window addSubview:self.loadingView];
}

- (void)bw_showLoadingWithText:(NSString *)text isCanTouchNextView:(BOOL)isCanTouchNextView isNotMask:(BOOL)isNotMask {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.loadingView.loadingText = text;
    self.loadingView.isCanTouchNextView = isCanTouchNextView;
    self.loadingView.isNotMask = isNotMask;
    [window addSubview:self.loadingView];
}

- (void)showGradientLoading {
    [self addSubview:self.loadingView];
}

- (void)bw_hiddenLoading {
    self.showing = NO;
    [self.loadingView.circleView stopRefreshAnimation];
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
    
    [self.overlayView removeFromSuperview];
    self.overlayView = nil;
}

#pragma mark - Setter & Getter

- (void)setLoadingView:(MMCLoadingView *)loadingView {
    objc_setAssociatedObject(self, &kLoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN);
}

- (MMCLoadingView *)loadingView {
    MMCLoadingView *_loadingView = objc_getAssociatedObject(self, &kLoadingViewKey);
    if (!_loadingView) {
        MMCLoadingView *loadingView = [[MMCLoadingView alloc] initWithFrame:CGRectMake(0, 0, 58, 58)];
        loadingView.backgroundColor = [UIColor colorWithRed:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f alpha: 0.5];
        _loadingView = loadingView;
        _loadingView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
        objc_setAssociatedObject(self, &kLoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN);
        
    }
    return _loadingView;
}

- (void)setOverlayView:(UIView *)overlayView {
    objc_setAssociatedObject(self, &kOverlayViewKey, overlayView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)overlayView {
    UIView *_overlayView = objc_getAssociatedObject(self, &kOverlayViewKey);
    if (!_overlayView) {
        UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        view.backgroundColor = [UIColor clearColor];
        _overlayView = view;
        objc_setAssociatedObject(self, &kOverlayViewKey, view, OBJC_ASSOCIATION_RETAIN);
    }
    
    return _overlayView;
}

- (void)setShowing:(BOOL)showing {
    objc_setAssociatedObject(self, &kLoadingViewShowingKey, @(showing), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)showing {
    NSNumber *showing = objc_getAssociatedObject(self, &kLoadingViewShowingKey);
    return showing.boolValue;
}


@end
