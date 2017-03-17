//
//  UIViewController+AKBBarButtonItems.h
//  AKBBarButtonItem
//
//  Created by v on 17/3/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^barItemBlock)();

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

//- (void)addWithTitle:(NSString *)title useBlock:(barItemBlock)block;

/**
 *  添加文字按钮，默认添加在右边
 */
- (void)addBarButtonItemWithTitle:(NSString *)title;

- (void)addBarButtonItemWithTitle:(NSString *)title on:(BarPosition)position;

/**
 *  添加多个文字按钮，默认添加在右边
 */
- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles;

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles on:(BarPosition)position;

@end
