//
//  ViewController.m
//  MVPDemoForSelf
//
//  Created by Mr Xie on 2018/11/8.
//  Copyright © 2018 Mr Xie. All rights reserved.
//

#import "ViewController.h"
#import "UserViewProtocol.h"
#import "Presenter.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UserViewProtocol>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property (nonatomic, strong) NSArray<UserModel *> *friendlyUIData;

@property (nonatomic,strong) Presenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.indicatorView];
    
    [self.presenter fetchData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellid" forIndexPath:indexPath];
    UserModel *model = self.friendlyUIData[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendlyUIData.count;
}

#pragma mark - UserViewProtocol

/// 有数据 刷新界面
- (void)userViewDataSource:(NSArray<UserModel *> *)data {
    self.friendlyUIData = data;
    [self.tableView reloadData];
}

/// 无数据
- (void)showEmptyView {
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Alert" message:@"show empty view" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertView animated:YES completion:^{
        
    }];
}

/// loading框
- (void)showIndicator {
    [self.indicatorView startAnimating];
    self.indicatorView.hidden = NO;
}

- (void)hideIndicator {
    [self.indicatorView stopAnimating];
}

#pragma mark - lazyload

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellid"];
    }
    return _tableView;
}

- (UIActivityIndicatorView *)indicatorView {
    if (_indicatorView == nil) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center = self.view.center;
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

- (Presenter *)presenter {
    if (_presenter == nil) {
        _presenter = [[Presenter alloc] init];
        [_presenter attachView:self]; //绑定
    }
    return _presenter;
}

@end
