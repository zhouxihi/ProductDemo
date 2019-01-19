//
//  UIView+NVLayout.h
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NVLayout)

@property (nonatomic, assign) NSInteger index;

- (NSInteger)nv_getIndex;

- (void)nv_setIndex:(NSInteger)index;

@end
