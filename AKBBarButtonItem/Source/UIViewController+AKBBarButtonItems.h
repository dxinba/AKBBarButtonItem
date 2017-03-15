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
typedef NS_ENUM(NSInteger, BarPosition) {
    BarPositionLeft,
    BarPositionRight
};

@interface UIViewController (AKBBarButtonItems)

- (void)setCustomViewWithImage:(NSString *)imageName;

- (void)setCustomViewWithText:(NSString *)text;

- (void)setCustomViewWithImage:(NSString *)imageName positon:(BarPosition)position;

- (void)setCustomViewWithText:(NSString *)text positon:(BarPosition)position;

- (void)setCustomViewAction:(SEL)action imageName:(NSString *)imageName andTag:(NSInteger)tag;

@end
