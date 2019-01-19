//
//  CategoryLeftViewModel.h
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ReactiveObjC.h>

@class CategoryTableModel;

@interface CategoryLeftViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<CategoryTableModel *> *models;
@property (nonatomic, strong) RACSubject    *cellClickSubject;

- (NSInteger)getNumberOfRows;
- (CategoryTableModel *)getModelAtIndexPath:(NSIndexPath *)indexPath;


@end
