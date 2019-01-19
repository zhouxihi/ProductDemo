//
//  HomeViewController.m
//  ProductDemo
//
//  Created by Jackey on 2017/8/2.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "HomeViewController.h"
#import "NVLayoutViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NVLayoutViewController *vc = [[NVLayoutViewController alloc] init];
    
    NSString *mockDataString   = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TangramMock" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    
    NSData *data        = [mockDataString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    vc.layoutModelArray = [[dict objectForKey:@"data"] objectForKey:@"cards"];
    vc.title            = @"首页";
    [vc setLayoutCallback:^(NSInteger index) {
        
        NSLog(@"你点击了第 %ld 个模块", index);
    }];
    
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
