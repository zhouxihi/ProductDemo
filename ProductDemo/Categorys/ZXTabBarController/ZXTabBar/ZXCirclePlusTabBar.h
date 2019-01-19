//
//  ZXCirclePlusTabBar.h
//  ProductDemo
//
//  Created by Jackey on 2017/8/1.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXCirclePlusTabBar;

@protocol ZXCirclePlusTabBarDelegate <UITabBarDelegate>

- (void)zx_circlePlusTabBarDidClickPlusButton:(ZXCirclePlusTabBar *)tabBar;

@end

@interface ZXCirclePlusTabBar : UITabBar

@property (nonatomic, strong) id<ZXCirclePlusTabBarDelegate> delegate;

@property (nonatomic, strong) UIColor   *outerColorOfCircle;
@property (nonatomic, strong) UIColor   *bgColorOfCircle;
@property (nonatomic, strong) UIColor   *plusColorOfCircle;
@property (nonatomic, strong) NSString  *titleOfPlus;


@end
