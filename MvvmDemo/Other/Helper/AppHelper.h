//
//  AppHelper.h
//  JMMVVMDemo
//
//  Created by Jianmei on 2019/11/13.
//  Copyright © 2019 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AppHelper : NSObject
    // 测试用 2017-10-11
/**
 打印Json,便于JsonModel属性生成
 **/
+ (void)printJsonData:(NSData *)jsonData;



/**
 纯色Image 20*20 的素材
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color;
    //30x30
+ (UIImage *)createImageWithColor22:(UIColor *)color;

+ (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)size;

#pragma mark - 颜色相关
+ (UIColor *)colorWithHexString: (NSString *)color;
+ (UIColor *)colorWithHexString: (NSString *)color WithAlpha:(float)alpha;


#pragma mark - 计算字符串宽高
+ (CGSize)sizeWithFont:(UIFont*)font Str:(NSString*)str withMaxWidth:(CGFloat)maxWidth;
#pragma mark - 计算富文本字符串宽高
+ (CGSize)sizeAttributedWithFont:(UIFont*)font Str:(NSMutableAttributedString*)str withMaxWidth:(CGFloat)maxWidth;

#pragma mark - 上传图片相关
/**
 将image转成NSData，在进行base64加密
 **/
+ (NSString *)getImageDataBase64:(UIImage *)image;

#pragma mark - 银行卡账号形式转换
/**
 正常号转银行卡号 － 增加4位间的空格
 **/
+ (NSString *)normalNumToBankNum:(NSString *)normalNum;

/**
 银行卡号转正常号 － 去除4位间的空格
 **/
+ (NSString *)bankNumToNormalNum:(NSString *)bankNum;

/**
 银行卡号中间部分星号 － 左右4位正常显示
 **/
+ (NSString *)bankNumToSecret:(NSString *)bankNum;

/**
 通过 parentId 筛选 城市或区（县）
 **/
+ (NSArray *)filterAraeFromAreaArray:(NSArray *)areaArray useParentId:(NSInteger)parentId;
/**
 通过 parentNo 筛选 商家分类
 **/
+ (NSArray *)filterClassFromAreaArray:(NSArray *)areaArray useParentNo:(NSString *)parentNo;
/**
 限制只能输入数字输入 (针对 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string)
 **/
+ (BOOL)validateNumber:(NSString*)number;
/**
 压缩图片
 **/
+ (UIImage *)compressImageWith:(UIImage *)image;

/**
 去除 “emoji表情” 的方法
 **/
+ (NSString*)disable_EmojiString:(NSString *)text;

/**
 去除 “非中文” 的方法
 **/
+ (NSString*)disable_Non_CineseString:(NSString *)text;

/**
 判断沙盒文件是否存在
 **/
+ (BOOL)fileExistingWithFileName:(NSString *)fileName;

#pragma mark - 正则只能输入数字和字母
+ (BOOL) checkTeshuZifuNumber:(NSString *) CheJiaNumber;

#pragma mark - 将数字转成货币格式字符串
+ (NSString *)getMoneyStringWithMoneyNumber:(double)money;


#pragma mark - 去除掉首尾的空白字符和换行字符
+ (NSString *)connectedTogetherWithString:(NSString *)string;


    //图文混排，插入图片
+ (NSMutableAttributedString *)addAttribute:(NSString *)name withImg:(UIImage *)image withImgSize:(CGRect)bounds insertIndex:(NSInteger)index;

/**行间距*/
+ (NSMutableAttributedString *)returnLineSpacingWithStr:(NSString *)labelText  withLineSpacing:(CGFloat)lineCount withTextAlignmentCenter:(NSTextAlignment )alignment;

+ (NSMutableAttributedString *)returnLineSpacingWithStr22:(NSMutableAttributedString *)labelText  withLineSpacing:(CGFloat)lineCount withTextAlignmentCenter:(NSTextAlignment )alignment;

/**
 字符串两边字体的颜色设置
 
 @param string 字符串
 @param rang 范围
 @param color 颜色
 @return 返回富文本
 */
+ (NSMutableAttributedString *)returnStringColor:(NSString *)string rang:(NSRange)rang color:(UIColor *)color;
    //字符串两边字体的大小设置
+ (NSMutableAttributedString *)returnStringSize:(NSString *)string rang:(NSRange)rang size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
