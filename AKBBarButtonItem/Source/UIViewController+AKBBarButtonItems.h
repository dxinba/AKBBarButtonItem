//
//  UIViewController+AKBBarButtonItems.h
//  AKBBarButtonItem
//
//  Created by v on 17/3/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Default is Right
 */
typedef NS_ENUM(NSUInteger, BarPosition) {
    BarPositionRight,
    BarPositionLeft,
};

@interface UIViewController (AKBBarButtonItems)
/**
 *  在vc中重写该方法获得回调事件
 */
- (void)barButtonItemClick:(UIButton *)btn;

/**
 *  添加文字按钮，默认右边
 */
- (void)addBarButtonItemWithTitle:(NSString *)title;

- (void)addBarButtonItemWithTitle:(NSString *)title on:(BarPosition)position;

/**
 *  
 */
//- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles;

//- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles on:(BarPosition)position;

@end
