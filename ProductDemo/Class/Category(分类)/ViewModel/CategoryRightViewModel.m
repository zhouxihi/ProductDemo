//
//  CategoryRightViewModel.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryRightViewModel.h"
#import "CategoryCollectionModel.h"
#import "CategoryCycleModel.h"

@implementation CategoryRightViewModel

#pragma mark - Life cycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // 配置models数据
        [self configModels];
    }
    
    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName {
    
    self = [super init];
    if (self) {
        
        self.model = [CategoryTitleAndModels mj_objectWithFilename:fileName];
    }
    
    return self;
}

#pragma mark - Private method

- (void)configModels {
  
    self.model = [CategoryTitleAndModels mj_objectWithFilename:@"Recommand.plist"];
}

- (NSInteger)getNumberOfSections {

    return self.model.models.count;
}

- (NSInteger)getNumberOfRowsInSection:(NSInteger)section {
    
    return [[[self.model.models objectAtIndex:section] valueForKey:@"models"] count];
}

- (CategoryCollectionModel *)getModelAtIndexPath:(NSIndexPath *)indexPath {
    
    return [CategoryCollectionModel mj_objectWithKeyValues:[[[self.model.models objectAtIndex:indexPath.section] valueForKey:@"models"] objectAtIndex:indexPath.row]];
}

- (NSString *)getSectionNameofSection:(NSInteger)section {
    
    return [[self.model.models objectAtIndex:section] valueForKey:@"name"];
}

- (NSArray<CategoryCycleModel *> *)getCycleModels {
    
    if (self.model.cycles.count) {
        
        NSArray *array = [CategoryCycleModel mj_objectArrayWithKeyValuesArray:self.model.cycles];
        return array;
    }
    
    return nil;
}

- (NSArray<NSString *> *)getCycleImageURLs {
    
    if (self.model.cycles.count) {
        
        NSMutableArray *mutableArray = [@[] mutableCopy];
        for (NSDictionary *dict in self.model.cycles) {
            
            [mutableArray addObject:[dict valueForKey:@"img"]];
        }
        
        return mutableArray;
    }
    
    return nil;
}

- (NSString *)getActionURL:(NSIndexPath *)indexPath {
    
    if (self.model.models.count) {
        
        return [[[[self.model.models objectAtIndex:indexPath.section] valueForKey:@"models"] objectAtIndex:indexPath.row] valueForKey:@"action"];
    }
    
    return nil;
}

- (NSString *)getCycleViewActionURL:(NSInteger)index {
    
    if (self.model.cycles.count) {
        
        return [[self.model.cycles objectAtIndex:index] valueForKey:@"action"];
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

- (RACSubject *)cycleViewClickSubject {
    
    if (!_cycleViewClickSubject) {
        
        _cycleViewClickSubject = [RACSubject subject];
    }
    
    return _cycleViewClickSubject;
}

@end
