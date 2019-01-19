//
//  CategoryLeftTableCell.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/8.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryLeftTableCell.h"
#import "CategoryTableModel.h"

@implementation CategoryLeftTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CategoryTableModel *)model {
    
    if (model) {
        
        self.textLabel.text = model.categoryName;
    }
}

@end
