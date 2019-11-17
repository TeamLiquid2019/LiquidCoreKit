//
//  MBPageView.m
//  MotoBand
//
//  Created by 谭诚 on 2019/3/5.
//  Copyright © 2019 MotoBand-Eric. All rights reserved.
//

#import "MBPageView.h"

//Tools
#import "UIMacro.h"

//View

//controller

//Manager

//Model

//Widget

//ThirdParty


@interface MBPageView ()

@property (nonatomic,strong) UIView *dotView;

@end



@implementation MBPageView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self setBackgroundColor:RGBColor(235, 235, 235, 1)];
    
    _dotView = [[UIView alloc] init];
    [_dotView setBackgroundColor:RGBColor(54, 76, 163, 1)];
    [self addSubview:_dotView];
}

-(void)layoutSubviews{
    CGRect frame = self.frame;
    if (!CGRectEqualToRect(frame, CGRectZero)) {
        self.layer.cornerRadius = CGRectGetHeight(frame)/2;
        self.layer.masksToBounds = YES;
        CGFloat width = CGRectGetWidth(frame)/_numberOfPages;
        _dotView.layer.cornerRadius = CGRectGetHeight(frame)/2;
        self.layer.masksToBounds = YES;
        [_dotView setFrame:CGRectMake(width*_currentPage, 0, width, CGRectGetHeight(frame))];
    }
}

- (void)setNumberOfPages:(NSUInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self layoutSubviews];
}

- (void)setCurrentPage:(NSUInteger)currentPage{
    _currentPage = currentPage;
    [self layoutSubviews];
}




@end
