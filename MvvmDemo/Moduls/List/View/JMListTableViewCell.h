//
//  JMListTableViewCell.h
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/15.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMListCollectionCellViewModel.h"

@interface JMListTableViewCell : UITableViewCell
@property (nonatomic, strong) JMListCollectionCellViewModel *viewModel;

@end
