//
//  UIViewController+AKBBarButtonItems.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBBarButtonItems.h"

@implementation UIViewController (AKBBarButtonItems)

- (void)setCustomViewWithImage:(NSString *)imageName {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high", imageName]] forState:UIControlStateHighlighted];
    [bar setCustomView:button];
    self.navigationItem.rightBarButtonItem = bar;
}

- (void)setCustomViewWithText:(NSString *)text {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitle:text forState:UIControlStateNormal];
    [bar setCustomView:button];
    self.navigationItem.rightBarButtonItem = bar;
}

- (void)setCustomViewWithImage:(NSString *)imageName positon:(BarPosition)position {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high", imageName]] forState:UIControlStateHighlighted];
    [bar setCustomView:button];
    if (position == BarPositionLeft) {
        self.navigationItem.leftBarButtonItem = bar;
    }
    else self.navigationItem.rightBarButtonItem = bar;
}

- (void)setCustomViewWithText:(NSString *)text positon:(BarPosition)position {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitle:text forState:UIControlStateNormal];
    [bar setCustomView:button];
    if (position == BarPositionLeft) {
        self.navigationItem.leftBarButtonItem = bar;
    }
    else self.navigationItem.rightBarButtonItem = bar;
}

- (void)setCustomViewAction:(SEL)action imageName:(NSString *)imageName andTag:(NSInteger)tag {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_high", imageName]] forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [bar setCustomView:button];
    bar.tag = tag;
    self.navigationItem.leftBarButtonItem = bar;
}


@end
