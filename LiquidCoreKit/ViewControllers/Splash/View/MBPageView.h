//
//  MBPageView.h
//  MotoBand
//
//  Created by 谭诚 on 2019/3/5.
//  Copyright © 2019 MotoBand-Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBPageView : UIView

@property (nonatomic,assign) NSUInteger numberOfPages;
@property (nonatomic,assign) NSUInteger currentPage;

@end

NS_ASSUME_NONNULL_END
