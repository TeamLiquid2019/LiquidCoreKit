//
//  TLBaseViewController.h
//  LiquidCoreKit
//
//  Created by Eric on 2019/11/12.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLBaseViewController : UIViewController

- (void)setLeftBarButtomItemImage:(NSString*)imageName target:(id)target action:(SEL)action;

- (void)setLeftBarButtomItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (void)setRightBarButtomItemImage:(NSString*)imageName target:(id)target action:(SEL)action;

- (void)setRightBarButtomItemWithTitle:(NSString*)title target:(id)target action:(SEL)action;

- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
