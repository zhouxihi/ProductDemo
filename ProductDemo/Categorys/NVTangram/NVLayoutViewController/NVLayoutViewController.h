//
//  NVLayoutViewController.h
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NVLayoutBlock)(NSInteger index);

@interface NVLayoutViewController : UIViewController

@property (nonatomic, strong) NSMutableArray    *layoutModelArray;

- (void)setLayoutCallback:(NVLayoutBlock)callback;

@end
