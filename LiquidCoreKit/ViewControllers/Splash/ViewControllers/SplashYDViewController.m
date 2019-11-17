//
//  SplashYDViewController.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "SplashYDViewController.h"

#import "UIMacro.h"
#import "PixelUtil.h"
#import "MBPageView.h"
#import "AppDelegate.h"

#import <YYLabel.h>
#import <YYTextAttribute.h>
#import <Masonry.h>
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface SplashYDViewController ()<UIScrollViewDelegate>
{
    NSUInteger _index;
}
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *ydView;

@end

@implementation SplashYDViewController

#pragma mark - < 生命周期方法 >

- (instancetype)init{
    if (self = [super init]) {
        _index = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    
    [self initView];
}

- (void)dealloc{
    
}

#pragma mark - < 内部方法 >

- (void)initView{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //初始化UI控件
    [self.view addSubview:self.ydView];
    [self.ydView addSubview:self.scrollView];
    
    
    NSArray *picNameArray = YDPicNameArray;
    NSArray *titleArray  = YDTitleArray;
    NSArray *desTitleArray = YDDesTitleArray;
    
    for (int i = 0; i< picNameArray.count; i++) {
        _index = i;
        if (i == picNameArray.count - 1) {
            UIView *view6 = [self createSplashLastViewWithImage:picNameArray[i] andTitle:titleArray[i] andDes:desTitleArray[i]];
            [view6 setTag:picNameArray.count];
            [view6 setFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight)];
            [_scrollView addSubview:view6];
        }else{
            UIView *view = [self createSplashViewWithImage:picNameArray[i] andTitle:titleArray[i] andDes:desTitleArray[i]];
            [view setFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight)];
            [_scrollView addSubview:view];
        }
    }
    
    [_scrollView setContentSize:CGSizeMake(ScreenWidth*picNameArray.count, ScreenHeight)];
}

- (UIView *)createSplashViewWithImage:(NSString *)imageName andTitle:(NSString *)title andDes:(NSString *)des{
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView.layer setMasksToBounds:YES];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:imageName]];
    [view addSubview:imageView];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [titleLabel setTextColor:RGBColor(54, 76, 163, 1)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).with.offset(40);
        make.right.equalTo(view).with.offset(-40);
        make.top.equalTo(view).with.offset([PixelUtil convert375_667HeightPixel:521]);
        make.height.mas_equalTo(28);
    }];
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = 18;
    
    YYLabel *desLabel = [[YYLabel alloc] init];
    [desLabel setText:des];
    desLabel.linePositionModifier = modifier;
    desLabel.numberOfLines = 0;
    desLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    [desLabel setFont:[UIFont systemFontOfSize:14]];
    [desLabel setTextColor:RGBColor(150, 150, 150, 1)];
    [desLabel setNumberOfLines:0];
    [desLabel setTextAlignment:NSTextAlignmentLeft];
    [view addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
        make.left.right.equalTo(titleLabel);
        make.height.mas_equalTo(40);
        
    }];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14.f]];
    [nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    [nextBtn setTitleColor:RGBColor(54, 76, 163, 1) forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(onNext:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:nextBtn];
    
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desLabel.mas_bottom).offset(20);
        make.right.equalTo(view).offset(-30);
        make.size.mas_equalTo(CGSizeMake(50, 40));
    }];
    
    MBPageView *pageControl = [[MBPageView alloc]init];
    [view addSubview:pageControl];
    pageControl.numberOfPages = YDPicNameArray.count;
    pageControl.currentPage = _index;
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(titleLabel);
        make.centerY.equalTo(nextBtn);
        make.size.mas_equalTo(CGSizeMake(40, 4));
    }];
    
    if (ScreenHeight <= 480) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(view);
            make.height.mas_equalTo(@568);
        }];
    }else{
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
    }
    return view;
}

- (UIView *)createSplashLastViewWithImage:(NSString *)imageName andTitle:(NSString *)title andDes:(NSString *)des{
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView.layer setMasksToBounds:YES];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:imageName]];
    [view addSubview:imageView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:28]];
    [titleLabel setTextColor:RGBColor(54, 76, 163, 1)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).with.offset(40);
        make.right.equalTo(view).with.offset(-40);
        make.top.equalTo(view).with.offset([PixelUtil convert375_667HeightPixel:521]);
        make.height.mas_equalTo(28);
    }];
    
    
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = 16;
    
    YYLabel *desLabel = [[YYLabel alloc] init];
    [desLabel setText:des];
    desLabel.linePositionModifier = modifier;
    desLabel.numberOfLines = 0;
    desLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    [desLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [desLabel setTextColor:RGBColor(150, 150, 150, 1)];
    [desLabel setTextAlignment:NSTextAlignmentLeft];
    [view addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
        make.left.right.equalTo(titleLabel);
        make.height.mas_equalTo(40);
        
    }];
    
    
    if (ScreenHeight <= 480) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(view);
            make.height.mas_equalTo(568);
        }];
    }else{
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
    }
    
    UIButton *startBtn = [[UIButton alloc] init];
    startBtn.layer.cornerRadius = 17.f;
    startBtn.layer.masksToBounds = YES;
    [startBtn.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    [startBtn setTitle:@"进入" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(OnStart:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:startBtn];
    
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desLabel.mas_bottom).with.offset(23);
        make.right.equalTo(view).with.offset(-40);
        make.size.mas_equalTo(CGSizeMake(70, 34));
    }];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)RGBColor(219, 73, 164, 1).CGColor, (__bridge id)RGBColor(119, 68, 196, 1).CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, 70, 34);
    [startBtn.layer insertSublayer:gradientLayer atIndex:0];
    
    MBPageView *pageControl = [[MBPageView alloc]init];
    pageControl.numberOfPages = YDPicNameArray.count;
    pageControl.currentPage = _index;
    [view addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(titleLabel);
        make.centerY.equalTo(startBtn);
        make.size.mas_equalTo(CGSizeMake(40, 4));
    }];
    
    return view;
}

#pragma mark - < 外部方法 >


#pragma mark - < UI操作 >

- (void)onNext:(UIButton *)sender{
    int  index = _scrollView.contentOffset.x/_scrollView.frame.size.width;
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*(index+1), 0) animated:YES];
}

- (void)OnStart:(UIButton *)sender{
    sender.enabled = NO;
    if (self.fromHelpAndFeedback) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [[AppDelegate shareAppDelegate] changeToTabsViewController];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>scrollView.contentSize.width-ScreenWidth*4/5) {
        [self OnStart:nil];
    }
}

#pragma mark - < Lazy Load >

- (UIView *)ydView{
    if (!_ydView) {
        _ydView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        UIImageView *bgImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*4, ScreenHeight)];
        [bgImageView1 setImage:[UIImage imageNamed:@"intro_backgroung"]];
        [_ydView addSubview:bgImageView1];
    }
    return _ydView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,ScreenHeight)];
        _scrollView.pagingEnabled=YES;
        [_scrollView setDelegate:self];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
