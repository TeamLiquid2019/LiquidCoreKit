//
//  LoginViewController.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/17.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "LoginViewController.h"


#import "UINavigationController+FDFullscreenPopGesture.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - < 生命周期方法 >

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    
    [self initView];
    [self initData];
    [self initNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)dealloc{
    
}


#pragma mark - < 内部方法 >

- (void)initView{
    
}

- (void)initData{
    
}

- (void)initNotification{
    
}

#pragma mark - < 外部方法 >


#pragma mark - < UI操作 >

- (void)leftBarButtonClick:(id)sender{
    
}

- (void)rightBarButtonClick:(id)sender{
    
}

#pragma mark - < Lazy Load >

@end
