//
//  NVSingleTextElement.m
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#define LableFont       [UIFont fontWithName:@"STHeitiTC-Medium" size:14]
#define LableTextColor  [UIColor grayColor]
#define LableHeight     30.0f

#import "NVSingleTextElement.h"

@interface NVSingleTextElement()

@property (nonatomic, strong) UILabel   *lable;

@end

@implementation NVSingleTextElement

- (UILabel *)lable {
    
    if (_lable == nil) {
        
        _lable = [[UILabel alloc] init];
        [self addSubview:_lable];
    }
    
    return _lable;
}

- (void)mui_afterGetView {
    
    self.lable.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    self.lable.text           = self.text;
    self.lable.textAlignment  = NSTextAlignmentCenter;
    self.lable.font           = LableFont;
    self.lable.textColor      = LableTextColor;
}

+ (CGFloat)heightByModel:(TangramDefaultItemModel *)itemModel {
    
    return LableHeight;
}

@end
