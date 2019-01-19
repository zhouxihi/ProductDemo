//
//  NVImageWithTextElement.m
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "NVImageWithTextElement.h"
#import <UIImageView+WebCache.h>

@interface NVImageWithTextElement()

@property (nonatomic, strong) UIImageView   *imageView;

@property (nonatomic, strong) UILabel       *titleLable;

@end

@implementation NVImageWithTextElement

- (UIImageView *)imageView {
    
    if (_imageView == nil) {
        
        _imageView = [[UIImageView alloc] init];
        
        _imageView.userInteractionEnabled = NO;
        _imageView.contentMode            = UIViewContentModeScaleToFill;
        _imageView.clipsToBounds          = YES;
        
        [self addSubview:_imageView];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _imageView;
}

- (UILabel *)titleLable {
    
    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc] init];
        
        _titleLable.textColor = [UIColor blackColor];
        
        [self addSubview:_titleLable];
    }
    
    return _titleLable;
}

- (void)setImgUrl:(NSString *)imgUrl {
    
    if (imgUrl.length > 0) {
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    }
}

- (void)setText:(NSString *)text {
    
    if (text) {
        
        self.titleLable.text = text;
    } else {
        
        self.titleLable.text = @"";
    }
    
    [self.titleLable sizeToFit];
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    if (frame.size.width > 0 && frame.size.height > 0) {
        
        [self mui_afterGetView];
    }
}

- (void)mui_afterGetView {
    
    if (self.titleLable.text) {
        
        self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height / 5 * 4);
        self.titleLable.frame = CGRectMake(0, self.imageView.frame.size.height, self.frame.size.width, self.frame.size.height / 5 * 1);
        
        self.titleLable.textAlignment   = NSTextAlignmentCenter;
        self.titleLable.textColor       = [UIColor lightGrayColor];
        self.titleLable.backgroundColor = [UIColor whiteColor];
    } else {
        
        self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
}

+ (CGFloat)heightByModel:(TangramDefaultItemModel *)itemModel {
    
    return 80.f;
}

@end
