//
//  CategoryRightSectionView.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryRightSectionView.h"

#define RightTitleFont [UIFont fontWithName:@"STHeitiSC-Medium" size:12]

@interface CategoryRightSectionView ()

@property (nonatomic, strong) UILabel *lable;

@end

@implementation CategoryRightSectionView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.lable = [[UILabel alloc] init];
        
        [self addSubview:self.lable];
        [self setLayout];
    }
    
    return self;
}

- (void)config {
    
    self.lable = [[UILabel alloc] init];
    
    [self addSubview:self.lable];
    
    [self setLayout];
}

- (void)setLayout {
    
    // 设置标签的布局
    [self.lable autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
    [self.lable autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.lable autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
    
    // 设置标签的属性
    self.lable.textAlignment = NSTextAlignmentLeft;
    self.lable.font          = RightTitleFont;
    
}

- (void)setName:(NSString *)name {
    
    if (name) {
        
        self.lable.text = name;
    }
}

@end
