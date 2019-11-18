//
//  UIMacro.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h
#import <UIKit/UIKit.h>

#define UI_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define UI_SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
    // 适配 等比放大控件
#define Size(x)                   ((x)*UI_SCREEN_WIDTH*1.0/375.0)
#define SizeInt(x)                   ((NSInteger)((x)*UI_SCREEN_WIDTH/375))

/** 一像素 */
#define UI_LINE_HEIGHT (1.f / [[UIScreen mainScreen] scale])
#define SINGLE_LINE_WIDTH           (1.0 / [UIScreen mainScreen].scale)


#define FONT_BanJiao(fontSize)  [UIFont fontWithName:@"Arial" size:(fontSize)]
#define FONT_RegularSize(fontSize) [UIFont fontWithName:@"PingFangSC-Regular" size:(fontSize)]
#define FONT_LightSize(fontSize) [UIFont fontWithName:@"PingFangSC-Light" size:(fontSize)]


#define  ShopHome_Left_W   UI_SCREEN_WIDTH * (75.0/375)
#define  ShopHome_Right_W  UI_SCREEN_WIDTH * (300.0/375)
#define  collectionCellH    ((ShopHome_Right_W - 30)/2 + 97)
#endif /* UIMacro_h */
