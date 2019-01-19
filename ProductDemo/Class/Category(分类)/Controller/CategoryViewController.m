//
//  CategoryViewController.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/2.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryLeftTable.h"
#import "CategoryLeftViewModel.h"
#import "CategoryRightCollection.h"
#import "CategoryRightViewModel.h"
#import "BaseWebViewController.h"

@interface CategoryViewController ()

@property (nonatomic, strong) CategoryLeftViewModel     *leftViewModel;
@property (nonatomic, strong) CategoryLeftTable         *leftTable;
@property (nonatomic, strong) CategoryRightCollection   *rightCollection;
@property (nonatomic, strong) CategoryRightViewModel    *rightViewModel;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加左侧分类栏
    self.leftViewModel = [[CategoryLeftViewModel alloc] init];
    self.leftTable     = [[CategoryLeftTable alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 4, self.view.frame.size.height - 64) viewModel:self.leftViewModel];

    [self.view addSubview:self.leftTable];
    
    // 添加右侧分类栏
    self.rightViewModel = [[CategoryRightViewModel alloc] init];
    self.rightCollection = [[CategoryRightCollection alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4, 0, SCREEN_WIDTH * 3/4, SCREEN_HEIGHT - 64) viewModel:self.rightViewModel];
    
    @weakify(self)
    [self.rightViewModel.cellClickSubject subscribeNext:^(NSString * x) {
        
        @strongify(self)
        BaseWebViewController *webVC = [[BaseWebViewController alloc] init];
        webVC.url = x;
        
        [self.navigationController pushViewController:webVC animated:YES];
    }];
    
    [self.rightViewModel.cycleViewClickSubject subscribeNext:^(NSString * x) {
        
        @strongify(self)
        BaseWebViewController *webVC = [[BaseWebViewController alloc] init];
        webVC.url = x;
        
        [self.navigationController pushViewController:webVC animated:YES];
    }];

    [self.view addSubview:self.rightCollection];
}


@end
