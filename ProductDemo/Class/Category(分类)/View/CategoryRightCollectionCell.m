//
//  CategoryRightCollectionCell.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryRightCollectionCell.h"
#import "CategoryCollectionModel.h"
#import "UIImage+Image.h"
#import "UIColorHelper.h"

#import <SDWebImage/UIImageView+WebCache.h>

#define RightLableFont [UIFont fontWithName:@"PingFang SC" size:12]

@interface CategoryRightCollectionCell ()

@property (nonatomic, strong) UIImageView   *img;
@property (nonatomic, strong) UILabel       *lable;

@end

@implementation CategoryRightCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.img   = [[UIImageView alloc] init];
        self.lable = [[UILabel alloc] init];
        
        [self addSubview:self.img];
        [self addSubview:self.lable];
        
        [self setLayout];
    }
    
    return self;
}

- (void)setLayout {
    
    // 设置图片的大小和位置
    [self.img autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:20];
    [self.img autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.img autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
    [self.img autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.img];
    
    // 设置标签的大小和位置
    [self.lable autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.img];
    [self.lable autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
    [self.lable autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
    [self.lable autoSetDimension:ALDimensionHeight toSize:40];
    
    // 设置标签属性
    self.lable.textAlignment = NSTextAlignmentCenter;
    self.lable.font          = RightLableFont;
    self.lable.numberOfLines = 2;
    
}

- (void)setModel:(CategoryCollectionModel *)model {
    
    if (model) {
        
        if (model.name) {
            
            self.lable.text = model.name;
        }
        
        if (model.icon) {
            
            [self.img sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageWithColor:[UIColor whiteColor]] options:SDWebImageAllowInvalidSSLCertificates];
        }
    }
}

@end
