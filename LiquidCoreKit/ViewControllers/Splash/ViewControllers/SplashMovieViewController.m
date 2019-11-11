//
//  SplashMovieViewController.m
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/12.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "SplashMovieViewController.h"

#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIMacro.h"
#import "LiquidCoreMacro.h"
#import "AppDelegate.h"

#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>
#import <YYLabel.h>
#import <NSAttributedString+YYText.h>
#import <UIImage+YYAdd.h>

@interface SplashMovieViewController ()

@property(nonatomic,strong)AVPlayer *player;

@end

@implementation SplashMovieViewController

#pragma mark - < 生命周期方法 >

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    [self initPlayer];
    [self initView];
    [self initData];
    [self initNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    if(_player){
          [_player play];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(_player){
        [_player pause];
    }
}

- (void)dealloc{
    [_player pause];
    _player = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




#pragma mark - < 内部方法 >

- (void)initView{
    UIImageView *motoBandIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash_icon"]];
    [self.view addSubview:motoBandIcon];
    
    [motoBandIcon mas_makeConstraints:^(MASConstraintMaker *make){
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuide).with.offset(80);
        } else {
            make.top.equalTo(self.view).with.offset(80);
        }
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(180/2, 162/2));
    }];
    
    //让骑行更快乐
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"让 骑 行 更 快 乐"];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:label];

    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-60);
        make.height.mas_equalTo(14);
    }];

    UIButton *btn = [[UIButton alloc] init];
    [btn.layer setCornerRadius:4];
    [btn setClipsToBounds:YES];
    [btn setTitle:@"登录/注册" forState:UIControlStateNormal];
    [btn setTitleColor:RGBColor(49, 52, 52, 1) forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:RGBColor(255, 206, 0, 1) size:CGSizeMake(255, 44)] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btn addTarget:self action:@selector(OnLogonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(255, 44));
        make.bottom.equalTo(label.mas_top).with.offset(-40);
    }];
    
    //登录注册表示同意 隐私政策 和 用户协议
    YYLabel *privacyProtocolLabel = [[YYLabel alloc]init];
    privacyProtocolLabel.ignoreCommonProperties = YES;
    [self.view addSubview:privacyProtocolLabel];
    
    
    NSString *privacyPolicyStr = @"隐私政策";
    NSString *userAgreementStr = @"用户协议";
    
    NSString *privacyProtocolString = [NSString stringWithFormat:@"登录注册表示同意 %@ 和 %@",privacyPolicyStr,userAgreementStr];
    NSMutableAttributedString *privacyProtocolattStr = [[NSMutableAttributedString alloc] initWithString:privacyProtocolString];
    privacyProtocolattStr.font = [UIFont systemFontOfSize:10.f];
    privacyProtocolattStr.color = RGBColor(133, 139, 143, 1);
    
    // 高亮状态的背景
    YYTextBorder *highlightBorder = [YYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = RGBColor(255, 206, 0, 1);
    
    NSArray *highlightTextArray = @[privacyPolicyStr,userAgreementStr];
    for (NSString *string in highlightTextArray) {
        NSRange searchRange = NSMakeRange(0, privacyProtocolattStr.length);
        NSRange range = [privacyProtocolattStr.string rangeOfString:string options:kNilOptions range:searchRange];
        if (range.location == NSNotFound) break;
        [privacyProtocolattStr setUnderlineStyle:NSUnderlineStyleSingle range:range];
        [privacyProtocolattStr setUnderlineColor:RGBColor(133, 139, 143, 1) range:range];
        // 高亮状态
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBackgroundBorder:highlightBorder];
        // 数据信息，用于稍后用户点击
        if ([string isEqualToString:privacyPolicyStr]) {
            highlight.userInfo = @{@"PrivacyUnderline" : @""};
        }else if ([string isEqualToString:userAgreementStr]){
            highlight.userInfo = @{@"ProtocolUnderline" : @""};
        }
        [privacyProtocolattStr setTextHighlight:highlight range:range];
    }
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(ScreenWidth-10, CGFLOAT_MAX);
    
    container.maximumNumberOfRows = 1;
    YYTextLayout *privacyProtocolLayout = [YYTextLayout layoutWithContainer:container text:privacyProtocolattStr];
    privacyProtocolLabel.textLayout = privacyProtocolLayout;
    
    [privacyProtocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-20);
        make.size.mas_equalTo(privacyProtocolLayout.textBoundingSize);
    }];
    
    DECLARE_WEAK_SELF;
    privacyProtocolLabel.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DECLARE_STRONG_SELF;
        if (strongSelf) {
            [strongSelf onClickContainerView:containerView text:text range:range rect:rect];
        }
    };
}

- (void)initData{
    
}

- (void)initNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification
                                              object:nil];
}

- (void)initPlayer{
    //创建播放器层
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"splash_movie.mp4" withExtension:nil subdirectory:nil];
    AVPlayerItem *playeritem = [AVPlayerItem playerItemWithURL:url];
    _player = [AVPlayer playerWithPlayerItem:playeritem];
//    // 通过 KVO 监听AVPlayerItem的status和loadedTimeRange属性
//    [self addObserverToPlayerItem:playeritem];
  
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    CGFloat bgWeight = 750*1.0*ScreenHeight/1334;
    playerLayer.frame = CGRectMake(-(bgWeight - ScreenWidth)/2, 0, bgWeight, ScreenHeight);
//        playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
    [_player play];//播放视频
}

#pragma mark - < UI操作 >

- (void)OnLogonClicked:(id)sender{
//    Logon2_0_0ViewController *logonVC = [[Logon2_0_0ViewController alloc] init];
//    [self.navigationController pushViewController:logonVC animated:YES];
}

-(void)onClickContainerView:(UIView *)containerView text:(NSAttributedString *)text range:(NSRange )range rect:(CGRect)  rect{
//    if (range.location >= text.length) return;
//    YYTextHighlight *highlight = [text attribute:YYTextHighlightAttributeName atIndex:range.location];
//    NSDictionary *info = highlight.userInfo;
//    if (info.count == 0) return;
//    if (info[@"PrivacyUnderline"]) {
//        NSString *url = info[@"PrivacyUnderline"];
//        MBNomalWebViewController *controller = [[MBNomalWebViewController alloc]init];
//        [controller setTitleStr:@"隐私政策"];
//        [controller setUrl:url];
//        [controller setIsPresent:YES];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
//        nav.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:nav animated:YES completion:nil];
//    }else if (info[@"ProtocolUnderline"]){
//        NSString *url = info[@"ProtocolUnderline"];
//        MBNomalWebViewController *controller = [[MBNomalWebViewController alloc]init];
//        [controller setTitleStr:@"用户协议"];
//        [controller setUrl:url];
//        [controller setIsPresent:YES];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
//        nav.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:nav animated:YES completion:nil];
//    }
}

#pragma mark - < 通知 >
- (void)appWillResignActive:(NSNotification *)notification{
    if (_player) {
        [_player pause];
    }
}

-(void)appBecomeActive:(NSNotification *)notification{
      if (_player) {
        [_player play];
      }
}

- (BOOL)prefersStatusBarHidden {
    UIViewController *controller = [AppDelegate shareAppDelegate].window.rootViewController;
    if ([controller isKindOfClass:[self class]]) {
        return YES;
    }
    return NO;
}

//播放完成通知

-(void)playbackFinished:(NSNotification*)notification{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self playbackFinished];
    });
}

-(void)playbackFinished{
    // 播放完成后重复播放
    // 跳到最新的时间点开始播放
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

@end
