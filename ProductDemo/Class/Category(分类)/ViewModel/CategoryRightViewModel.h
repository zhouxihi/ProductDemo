//
//  CategoryRightViewModel.h
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryTitleAndModels.h"
#import <ReactiveObjC.h>

@class CategoryCollectionModel;
@class CategoryCycleModel;

@interface CategoryRightViewModel : NSObject

@property (nonatomic, strong) CategoryTitleAndModels *model;
@property (nonatomic, strong) RACSubject *cellClickSubject;
@property (nonatomic, strong) RACSubject *cycleViewClickSubject;

- (instancetype)initWithFileName:(NSString *)fileName;

- (NSInteger)getNumberOfRowsInSection:(NSInteger)section;
- (NSInteger)getNumberOfSections;
- (CategoryCollectionModel *)getModelAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)getSectionNameofSection:(NSInteger)section;
- (NSArray<CategoryCycleModel *> *)getCycleModels;
- (NSArray<NSString *> *)getCycleImageURLs;
- (NSString *)getActionURL:(NSIndexPath *)indexPath;
- (NSString *)getCycleViewActionURL:(NSInteger)index;

@end
