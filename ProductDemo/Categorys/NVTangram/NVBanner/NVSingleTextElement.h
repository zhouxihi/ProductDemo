//
//  NVSingleTextElement.h
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+NVLayout.h"

#import <TangramElementHeightProtocol.h>
#import <TMMuiLazyScrollView.h>

@interface NVSingleTextElement : UIView<TangramElementHeightProtocol, TMMuiLazyScrollViewCellProtocol>

@property (nonatomic, strong) NSString *text;

@end