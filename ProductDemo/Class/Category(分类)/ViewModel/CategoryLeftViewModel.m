//
//  CategoryLeftViewModel.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryLeftViewModel.h"
#import "CategoryTableModel.h"

@implementation CategoryLeftViewModel

#pragma mark - Life Cycle

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // 配置models数据
        [self configModels];
    }
      
    return self;
}

#pragma mark - Private methods

- (void)configModels {
    
    // 项目中按照实际情况修改初始化方法和数据来源
    
    self.models = [CategoryTableModel mj_objectArrayWithFilename:@"LeftCategorys.plist"];
}

- (NSInteger)getNumberOfRows {
    
    return self.models.count;
}

- (CategoryTableModel *)getModelAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < self.models.count) {
        
        return [self.models objectAtIndex:indexPath.row];
    }
    return nil;
}

#pragma mark - Lazy init

- (RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
        
        _cellClickSubject = [RACSubject subject];
    }
    
    return _cellClickSubject;
}

@end
