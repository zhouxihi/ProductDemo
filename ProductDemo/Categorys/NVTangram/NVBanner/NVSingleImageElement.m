//
//  NVSingleImageElement.m
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "NVSingleImageElement.h"
#import <UIImageView+WebCache.h>

@interface NVSingleImageElement()

@property (nonatomic, strong) UIImageView   *imageView;

@end

@implementation NVSingleImageElement

- (UIImageView *)imageView {
    
    if (_imageView == nil) {
        
        _imageView = [[UIImageView alloc] init];
        
        _imageView.userInteractionEnabled = NO;
        _imageView.contentMode            = UIViewContentModeScaleToFill;
        _imageView.clipsToBounds          = YES;
        
        [self addSubview:_imageView];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return _imageView;
}

- (void)setImgUrl:(NSString *)imgUrl {
    
    if (imgUrl.length > 0) {
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    }
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    if (frame.size.width > 0 && frame.size.height > 0) {
        
        [self mui_afterGetView];
    }
}

- (void)mui_afterGetView {
    
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

+ (CGFloat)heightByModel:(TangramDefaultItemModel *)itemModel {
    
    return 100.f;
}

@end
