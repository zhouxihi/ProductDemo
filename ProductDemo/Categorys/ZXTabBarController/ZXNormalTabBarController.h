//
//  ZXNormalTabBarController.h
//  ProductDemo
//
//  Created by Jackey on 2017/8/1.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXNormalTabBarController : UITabBarController

/**
 初始化方法1

 @param controllers 控制器名称列表 (Notice: 需要把对应的控制器添加到PCH中)
 @param titles 控制器标题列表
 @param iconNames tabbar未选中是图标名称列表
 @param selectedIconNames tabbar选中时图标名称列表
 @return 创建好的TabBarController实例
 */
- (instancetype)initWithControllerNames:(NSArray <NSString *> *)controllers
                                 titles:(NSArray <NSString *> *)titles
                        normalIconNames:(NSArray <NSString *> *)iconNames
                      selectedIconNames:(NSArray <NSString *> *)selectedIconNames;

/**
 初始化方法2

 @param controllers 控制器实例列表
 @param titles 控制器标题列表
 @param iconNames tabbar未选中是图标名称列表
 @param selectedIconNames tabbar选中时图标名称列表
 @return 创建好的TabBarController实例
 */
- (instancetype)initWithControllers:(NSArray <UIViewController *> *)controllers
                             titles:(NSArray <NSString *> *)titles
                    normalIconNames:(NSArray <NSString *> *)iconNames
                  selectedIconNames:(NSArray <NSString *> *)selectedIconNames;

@end
