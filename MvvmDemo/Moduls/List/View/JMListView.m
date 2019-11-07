//
//  JMListView.m
//  MvvmDemo
//
//  Created by Jianmei on 2018/5/13.
//  Copyright © 2018年 Jianmei. All rights reserved.
//

#import "JMListView.h"
#import "JMListHeaderView.h"
#import "JMListSectionHeaderView.h"
#import "JMListViewModel.h"
#import "JMListTableViewCell.h"


@interface JMListView ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) JMListViewModel *viewModel;
@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) JMListView *listHeaderView;
@property (strong, nonatomic) JMListSectionHeaderView *sectionHeaderView;
@end

@implementation JMListView

- (instancetype)initWithViewModel:(id)viewModel {
    
    self = [super init];
    if (self) {
        
        _viewModel = viewModel;
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}



- (void)setupViews {
    [self addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

}

- (void)bindViewModel {
    
    [self.viewModel.refreshDataCommand execute:nil];
    
    @weakify(self);
    
    [self.viewModel.refreshUI subscribeNext:^(id x) {
        
        @strongify(self);
        [self.mainTableView reloadData];
    }];
    
    [self.viewModel.refreshEndSubject subscribeNext:^(id x) {
        @strongify(self);
        
        [self.mainTableView reloadData];
        
        switch ([x integerValue]) {
            case HeaderRefresh_HasMoreData: {
                
                [self.mainTableView.mj_header endRefreshing];
                
                if (self.mainTableView.mj_footer == nil) {
                    
                    self.mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                        @strongify(self);
                        [self.viewModel.nextPageCommand execute:nil];
                    }];
                }
            }
                break;
            case HeaderRefresh_HasNoMoreData: {
                
                [self.mainTableView.mj_header endRefreshing];
                self.mainTableView.mj_footer = nil;
            }
                break;
            case FooterRefresh_HasMoreData: {
                
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer resetNoMoreData];
                [self.mainTableView.mj_footer endRefreshing];
            }
                break;
            case FooterRefresh_HasNoMoreData: {
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
            case RefreshError: {
                
                [self.mainTableView.mj_footer endRefreshing];
                [self.mainTableView.mj_header endRefreshing];
            }
                break;
                
            default:
                break;
        }
    }];
}

#pragma mark - lazyLoad
- (JMListViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[JMListViewModel alloc] init];
    }
    
    return _viewModel;
}

- (UITableView *)mainTableView {
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = self.listHeaderView;
        [_mainTableView registerClass:[JMListTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([JMListTableViewCell class])]];
        
        @weakify(self);
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            [self.viewModel.refreshDataCommand execute:nil];
        }];
        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [self.viewModel.nextPageCommand execute:nil];
        }];
    }
    
    return _mainTableView;
}

- (JMListHeaderView *)listHeaderView {
    
    if (!_listHeaderView) {
        
        _listHeaderView = [[JMListHeaderView alloc] initWithViewModel:self.viewModel.listHeaderViewModel];
        _listHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 160);
    }
    
    return _listHeaderView;
}

- (JMListSectionHeaderView *)sectionHeaderView {
    
    if (!_sectionHeaderView) {
        
        _sectionHeaderView = [[JMListSectionHeaderView alloc] initWithViewModel:self.viewModel.sectionHeaderViewModel];
    }
    
    return _sectionHeaderView;
}

#pragma mark - delegate

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    JMListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([JMListTableViewCell class])] forIndexPath:indexPath];
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewModel.cellClickSubject sendNext:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 45;
}


@end
