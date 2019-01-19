//
//  ZXNormalTabBar.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/1.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "ZXNormalTabBar.h"
#import "UIImage+Image.h"

@implementation ZXNormalTabBar

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        [self setTintColor:[UIColor grayColor]];
    }
    
    return self;
}

@end
