//
//  UIViewController+AKBLeftBarButton.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBLeftBarButton.h"

@implementation UIViewController (AKBLeftBarButton)

- (void)setCustomerViewAction:(SEL)action imageName:(NSString *)imageName andTag:(NSInteger)tag {
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
