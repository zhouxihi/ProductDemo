//
//  ZXNormalTabBarController.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/1.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "ZXNormalTabBarController.h"
#import "ZXNormalTabBar.h"
#import "ZXNavigationController.h"

@interface ZXNormalTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZXNormalTabBarController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColorHelper getColor:NavBarColor]} forState:UIControlStateSelected];
}

#pragma mark - init Method

- (instancetype)initWithControllers:(NSArray<UIViewController *> *)controllers
                             titles:(NSArray<NSString *> *)titles
                    normalIconNames:(NSArray<NSString *> *)iconNames
                  selectedIconNames:(NSArray<NSString *> *)selectedIconNames {
    
    self =  [super init];
    
    if (controllers.count == titles.count && iconNames.count == selectedIconNames.count) {
        
        if (titles.count == iconNames.count) {
            
            for (int i = 0; i < controllers.count; i ++) {
                
                UIViewController *viewController = [controllers objectAtIndex:i];
                viewController.title = [titles objectAtIndex:i];
                [viewController.tabBarItem setImage:[[UIImage imageNamed:[iconNames objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [viewController.tabBarItem setSelectedImage:[[UIImage imageNamed:[selectedIconNames objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                
                viewController.tabBarController.tabBar.tintColor = [UIColor grayColor];
                
                
                // 初始化NavigationController
                ZXNavigationController *nav = [[ZXNavigationController alloc] initWithRootViewController:viewController];
                
                
                [self addChildViewController:nav];
            }
            
            return self;
            
        } else {
            
            return nil;
        }
        
    }
    
    return nil;
}

#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    [self clickOnTabBarButton:[self getSelectedTabBarButton]];
}

#pragma mark - Private Methods

#pragma mark 替换系统tabbar
- (void)setUpTabBar {
    
    ZXNormalTabBar *tabBar = [[ZXNormalTabBar alloc] init];
    
    // 替换系统的tabbar
    [self setValue:tabBar forKey:@"tabBar"];
    
}

#pragma mark 获取TabBarButton
- (UIControl *)getSelectedTabBarButton {
    
    NSMutableArray *tabBarButtons = [@[] mutableCopy];
    
    for (UIView *tabBarButtton in self.tabBar.subviews) {
        
        if ([tabBarButtton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [tabBarButtons addObject:tabBarButtton];
        }
    }
    
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

#pragma mark 点击动画
- (void)clickOnTabBarButton:(UIControl *)tabBarButton {
    
    for (UIView *imageView in tabBarButton.subviews) {
        
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            
            // 创建动画
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            
            animation.keyPath         = @"transform.scale";
            animation.values          = @[@1.0, @1.1, @0.9, @1.0];
            animation.duration        = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            
            // 添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}



@end
