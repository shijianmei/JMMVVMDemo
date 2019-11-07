//
//  JMListCollectionCell.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMListCollectionCellViewModel.h"
@interface JMListCollectionCell : UICollectionViewCell

@property (nonatomic, strong) JMListCollectionCellViewModel *viewModel;

/**
 *  加入新圈子
 */
@property (nonatomic, strong) NSString *type;
@end
