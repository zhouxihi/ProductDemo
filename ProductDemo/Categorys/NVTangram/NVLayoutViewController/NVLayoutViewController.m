//
//  NVLayoutViewController.m
//  TangramDemo
//
//  Created by Jackey on 2017/6/9.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "NVLayoutViewController.h"
#import "NVElement.h"
#import "UIView+NVLayout.h"

#import <TangramDefaultItemModelFactory.h>
#import <TangramDefaultDataSourceHelper.h>
#import <TangramView.h>
#import <TangramBus.h>

@interface NVLayoutViewController ()<TangramViewDatasource>

@property (nonatomic, strong) TangramView   *tangramView;

@property (nonatomic, strong) TangramBus    *tangramBus;

@property (nonatomic, strong) NSArray       *layoutArray;

@property (nonatomic, strong) NVLayoutBlock callBack;

@end

@implementation NVLayoutViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightBarAction)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    
    //注册模板
    [self loadContent];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    _layoutArray = [TangramDefaultDataSourceHelper layoutsWithArray:_layoutModelArray
                                                         tangramBus:_tangramBus];
    
    [self.tangramView reloadData];

}

- (TangramBus *)tangramBus {
    
    if (_tangramBus == nil) {
        
        _tangramBus = [[TangramBus alloc] init];
    }
    
    return _tangramBus;
}

- (TangramView *)tangramView {
    
    if (_tangramView == nil) {
        
        _tangramView = [[TangramView alloc] init];
        
        _tangramView.frame           = self.view.bounds;
        _tangramView.backgroundColor = [UIColor whiteColor];
        
        [_tangramView setDataSource:self];
        
        [self.view addSubview:_tangramView];
    }
    
    return _tangramView;
}

- (void)setLayoutCallback:(NVLayoutBlock)callback {
    
    if (callback) {
        
        self.callBack = callback;
    }
}

- (void)loadContent {
    
    //注册banner模板
    [TangramDefaultItemModelFactory registElementType:@"1" className:@"NVSingleImageElement"];
    [TangramDefaultItemModelFactory registElementType:@"2" className:@"NVSingleTextElement"];
    [TangramDefaultItemModelFactory registElementType:@"3" className:@"NVImageWithTextElement"];
    [TangramDefaultItemModelFactory registElementType:@"4" className:@"NVSingleImageElementTypeOne"];
    [TangramDefaultItemModelFactory registElementType:@"5" className:@"NVSingleImageElementTypeTen"];
    [TangramDefaultItemModelFactory registElementType:@"6" className:@"NVSingleImageElementTypeTwo"];
    [TangramDefaultItemModelFactory registElementType:@"7" className:@"NVSingleImageElementTypeThree"];
    [TangramDefaultItemModelFactory registElementType:@"8" className:@"NVSingleImageElementTypeFour"];

}

#pragma mark - TangramViewDataSource methods

- (NSUInteger)numberOfLayoutsInTangramView:(TangramView *)view
{
    return self.layoutModelArray.count;
}

- (UIView<TangramLayoutProtocol> *)layoutInTangramView:(TangramView *)view atIndex:(NSUInteger)index
{
    return [self.layoutArray objectAtIndex:index];
}
- (NSUInteger)numberOfItemsInTangramView:(TangramView *)view forLayout:(UIView<TangramLayoutProtocol> *)layout
{
    return layout.itemModels.count;
}

- (NSObject<TangramItemModelProtocol> *)itemModelInTangramView:(TangramView *)view forLayout:(UIView<TangramLayoutProtocol> *)layout atIndex:(NSUInteger)index
{
    return [layout.itemModels objectAtIndex:index];;
}

- (UIView *)itemInTangramView:(TangramView *)view withModel:(NSObject<TangramItemModelProtocol> *)model forLayout:(UIView<TangramLayoutProtocol> *)layout atIndex:(NSUInteger)index
{
    UIView *reuseableView = [view dequeueReusableItemWithIdentifier:model.reuseIdentifier ];
    
    if (reuseableView) {
        reuseableView =  [TangramDefaultDataSourceHelper refreshElement:reuseableView byModel:model layout:layout tangramBus:self.tangramBus];
    }
    else
    {
        reuseableView =  [TangramDefaultDataSourceHelper elementByModel:model layout:layout tangramBus:self.tangramBus];
    }
    
    [reuseableView nv_setIndex:index];
    
    reuseableView.userInteractionEnabled = YES;
    [reuseableView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)]];
    
    return reuseableView;
}

- (void)click:(UIGestureRecognizer *)recognizer {
    
    UIView *reuseableView = (UIView *)recognizer.view;
    
    NSLog(@"click : %ld", [reuseableView nv_getIndex]);
    
    if (self.callBack) {
        
        self.callBack([reuseableView nv_getIndex]);
    }
}

- (void)leftBarAction {
    
}

- (void)rightBarAction {
    
}

@end
