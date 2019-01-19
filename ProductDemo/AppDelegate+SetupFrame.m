//
//  AppDelegate+SetupFrame.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/1.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "AppDelegate+SetupFrame.h"
#import "ZXNormalTabBarController.h"

@implementation AppDelegate (SetupFrame)

- (void)setupFrame {
    
    HomeViewController      *homeVC     = [[HomeViewController alloc] init];
    CategoryViewController  *categoryVC = [[CategoryViewController alloc] init];
    CartViewController      *cartVC     = [[CartViewController alloc] init];
    MineViewController      *mineVC     = [[MineViewController alloc] init];
    
    ZXNormalTabBarController *nav = [[[ZXNormalTabBarController alloc] init]
                                     initWithControllers:@[homeVC, categoryVC, cartVC, mineVC]
                                     titles:@[@"首页", @"分类", @"购物车", @"我的"]
                                     normalIconNames:@[@"tabr_01_up", @"tabr_02_up", @"tabr_04_up", @"tabr_05_up"]
                                     selectedIconNames:@[@"tabr_01_down", @"tabr_02_down", @"tabr_04_down", @"tabr_05_down"]];
    
    self.window.rootViewController = nav;
}

@end
