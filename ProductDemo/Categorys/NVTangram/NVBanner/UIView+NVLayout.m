//
//  UIView+NVLayout.m
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "UIView+NVLayout.h"
#import <objc/runtime.h>

static char baseDirectKey;

@implementation UIView (NVLayout)

- (NSInteger)nv_getIndex {
    
    if (objc_getAssociatedObject(self, &baseDirectKey)) {
        
        return [objc_getAssociatedObject(self, &baseDirectKey) integerValue];
    } else {
        
        return -1;
    }
}

- (void)nv_setIndex:(NSInteger)index {
 
    objc_setAssociatedObject(self, &baseDirectKey, [NSNumber numberWithInteger:index], OBJC_ASSOCIATION_ASSIGN);
}

@end
