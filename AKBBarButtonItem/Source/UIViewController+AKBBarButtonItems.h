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
 *
 */
- (void)barButtonItemClick:(UIButton *)btn;

/**
 *  添加文字按钮，默认右边
 */
- (void)addBarButtonItemWithTitle:(NSString *)title;

- (void)addBarButtonItemWithTitle:(NSString *)title position:(BarPosition)position;

/**
 *  
 */
//- (void)addBarButtonItemWithTitles:(NSArray *)titles;

//- (void)addBarButtonItemWithTitles:(NSArray *)titles position:(BarPosition)position;

@end
