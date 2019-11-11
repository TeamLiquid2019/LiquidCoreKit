//
//  TLBaseViewController.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/12.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "TLBaseViewController.h"

@interface TLBaseViewController ()

@property(nonatomic,strong)UIColor *navBarItemTitleColor;
@property(nonatomic,strong)UIColor *navBarTintColor;
@property(nonatomic,strong)UIImage *navBarBackgroundImage;

@property(nonatomic,strong)UIColor *backgroundColor;

@end

@implementation TLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航栏设置
    //导航栏返回按钮设置，默认没有文字，只有返回箭头
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]init];
    backBtn.title = @"";
    self.navigationItem.backBarButtonItem = backBtn;
    
    //修改导航栏背景颜色
    [self.navigationController.navigationBar setBackgroundImage:self.navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTintColor:self.navBarTintColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:self.navBarTintColor}];
    
    //背景设置
    [self.view setBackgroundColor:self.backgroundColor];
    
    //键盘控制
#warning --后期可以增加--
//    [[IQKeyboardManager sharedManager] setEnable:NO];
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
//    [[IQKeyboardManager sharedManager] setEnable:NO];
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
}

- (void)dealloc{
    NSLog(@"控制器：%@ 销毁 %@",self.class,NSStringFromSelector(_cmd));
}

#pragma mark - < 导航栏按钮设置 >

- (void)setLeftBarButtomItemImage:(NSString*)imageName target:(id)target action:(SEL)action
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.leftBarButtonItem = addButton;
}

- (void)setLeftBarButtomItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    [addButton setTintColor:self.navBarItemTitleColor];
    self.navigationItem.leftBarButtonItem = addButton;
}


- (void)setRightBarButtomItemImage:(NSString*)imageName target:(id)target action:(SEL)action
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)setRightBarButtomItemWithTitle:(NSString*)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    [addButton setTintColor:self.navBarItemTitleColor];
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark - Interface Orientation

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

//强制转屏（这个方法最好放在BaseVController中）
- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector  = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        // 从2开始是因为前两个参数已经被selector和target占用
        [invocation setArgument:&orientation atIndex:2];
        [invocation invoke];
    }
}

#pragma mark - < LazyLoad >

/**
 导航栏按钮字体颜色

 @return 默认返回白色，可自定义修改
 */
- (UIColor *)navBarItemTitleColor{
    if (_navBarItemTitleColor == nil) {
        _navBarItemTitleColor = [UIColor whiteColor];
    }
    return _navBarItemTitleColor;
}

/**
 背景颜色

 @return 默认返回白色，可自定义
 */
- (UIColor *)backgroundColor{
    if (_backgroundColor == nil) {
        _backgroundColor = [UIColor colorWithRed:49 green:52 blue:52 alpha:1];
    }
    return _backgroundColor;
}

/**
 导航栏标题颜色

 @return 默认返回白色，可自定义
 */
- (UIColor *)navBarTintColor{
    if (_navBarTintColor == nil) {
        _navBarTintColor = [UIColor whiteColor];
    }
    return _navBarTintColor;
}

/**
 导航栏背景图片

 @return 默认返回白色，可自定义
 */
- (UIImage *)navBarBackgroundImage{
    if (_navBarBackgroundImage == nil) {
        
        UIColor *color = [UIColor colorWithRed:49 green:52 blue:52 alpha:1];
        
        CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        _navBarBackgroundImage = theImage;
        
    }
    return _navBarBackgroundImage;
}


@end
