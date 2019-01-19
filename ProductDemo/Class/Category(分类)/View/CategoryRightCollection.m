//
//  CategoryRightCollection.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryRightCollection.h"
#import "CategoryRightViewModel.h"
#import "CategoryRightCollectionCell.h"
#import "CategoryRightSectionView.h"
#import "ULBCollectionViewFlowLayout.h"
#import "CategoryCycleModel.h"
#import <SDCycleScrollView.h>

@interface CategoryRightCollection ()<ULBCollectionViewDelegateFlowLayout, UICollectionViewDataSource, SDCycleScrollViewDelegate>

@property (nonatomic, strong) UICollectionView          *rightCollectionView;
@property (nonatomic, strong) CategoryRightViewModel    *viewModel;
@property (nonatomic, strong) SDCycleScrollView         *cycleView;

@end

@implementation CategoryRightCollection

- (instancetype)initWithFrame:(CGRect)frame viewModel:(CategoryRightViewModel *)viewModel {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.viewModel = viewModel;
        self.cycleView = nil;
        
        [self configView];
    }
    
    return self;
}

//- (void)setViewModel:(CategoryRightViewModel *)model {
//    
//    self.viewModel = model;
//    
//    if (self.cycleView) {
//        
//        [self.cycleView removeFromSuperview];
//        self.cycleView = nil;
//    }
//    
//    if (self.rightCollectionView) {
//        
//        [self.rightCollectionView removeFromSuperview];
//        self.rightCollectionView = nil;
//    }
//    [self configView];
//}

// 创建表单界面
- (void)configView {
    
    // 设置轮播
    NSArray *cycleArray = [self.viewModel getCycleModels];
    if (cycleArray) {

        self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, - ((SCREEN_WIDTH * 3/4 - 20 * 4 - 10 * 2) / 3 + 20 + 20), self.frame.size.width - 10, (SCREEN_WIDTH * 3/4 - 20 * 4 - 10 * 2) / 3 + 40) imageURLStringsGroup:[self.viewModel getCycleImageURLs]];
        
        self.cycleView.delegate = self;
    }
    
    // 设置表单
    
    ULBCollectionViewFlowLayout *flowLayout = [[ULBCollectionViewFlowLayout alloc] init];
    
    flowLayout.scrollDirection         = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize                = CGSizeMake((SCREEN_WIDTH * 3/4 - 20 * 4 - 10 * 2) / 3, (SCREEN_WIDTH * 3/4 - 20 * 4 - 10 * 2) / 3 + 40);
    flowLayout.minimumLineSpacing      = 20.0f;
    flowLayout.minimumInteritemSpacing = 20.0f;
    flowLayout.headerReferenceSize     = CGSizeMake(self.frame.size.width - 20, 40);
    flowLayout.footerReferenceSize     = CGSizeMake(self.frame.size.width - 20, 20);
    
    self.rightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 20, self.frame.size.width - 20, self.frame.size.height - 40) collectionViewLayout:flowLayout];
    
    self.rightCollectionView.delegate     = self;
    self.rightCollectionView.dataSource   = self;
    self.rightCollectionView.showsVerticalScrollIndicator = NO;
    
    if (self.cycleView) {
        
        self.rightCollectionView.contentInset = UIEdgeInsetsMake((SCREEN_WIDTH * 3/4 - 20 * 4 - 10 * 2) / 3 + 20 + 20, 0, 0, 0);
        [self.rightCollectionView addSubview:self.cycleView];
    }
    
    self.rightCollectionView.backgroundColor = [UIColorHelper getColor:ControllerBGColor];
    
    [self.rightCollectionView registerClass:[CategoryRightCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([CategoryRightCollectionCell class])];
    
    [self.rightCollectionView registerClass:[CategoryRightSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CategoryRightSectionView class])];
    
    [self.rightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    
    [self addSubview:self.rightCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.viewModel getNumberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.viewModel getNumberOfSections];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryRightCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CategoryRightCollectionCell class]) forIndexPath:indexPath];
    
    cell.model = [self.viewModel getModelAtIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        CategoryRightSectionView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CategoryRightSectionView class]) forIndexPath:indexPath];
        header.backgroundColor = [UIColorHelper getColor:ControllerBGColor];
        
        [header config];
        header.name = [self.viewModel getSectionNameofSection:indexPath.section];
        
        return header;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        
        footer.backgroundColor = [UIColorHelper getColor:ControllerBGColor];
        
        return footer;
    }
    
    return nil;

}

#pragma mark - ULBCollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 20, 20, 20);
}

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout colorForSectionAtIndex:(NSInteger)section {
    
    return [UIColor whiteColor];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *action = [self.viewModel getActionURL:indexPath];
    if (action) {
        
        [self.viewModel.cellClickSubject sendNext:action];
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSString *action = [self.viewModel getCycleViewActionURL:index];
    if (action) {
        
        [self.viewModel.cycleViewClickSubject sendNext:action];
    }
}

@end
