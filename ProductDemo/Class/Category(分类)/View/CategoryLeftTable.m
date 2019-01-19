//
//  CategoryLeftTable.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryLeftTable.h"
#import "CategoryLeftTableCell.h"

#define LeftLableFont [UIFont fontWithName:@"PingFang SC" size:14]

@interface CategoryLeftTable ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView           *leftTableView;
@property (nonatomic, strong) CategoryLeftViewModel *viewModel;

@end

@implementation CategoryLeftTable

- (instancetype)initWithFrame:(CGRect)frame viewModel:(CategoryLeftViewModel *)viewModel {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.viewModel = viewModel;
        
        [self configView];
    }
    
    return self;
}

// 创建表单界面
- (void)configView {
    
    self.leftTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    
    self.leftTableView.delegate   = self;
    self.leftTableView.dataSource = self;
    [self addSubview:self.leftTableView];
    
    if ([self.viewModel getNumberOfRows]) {
        
        // 默认选中第一个
        NSIndexPath *defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.leftTableView selectRowAtIndexPath:defaultIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.viewModel getNumberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryLeftTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CategoryLeftTableCell class])];
    
    if (!cell) {
        
        cell = [[CategoryLeftTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([CategoryLeftTableCell class])];
    }
    
    cell.textLabel.textAlignment        = NSTextAlignmentCenter;
    cell.textLabel.font                 = LeftLableFont;
    cell.selectedBackgroundView         = [[UIImageView alloc] initWithImage:\
                    [UIImage imageWithColor:[UIColorHelper getColor:ControllerBGColor]]];
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    cell.model                          = [self.viewModel getModelAtIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
