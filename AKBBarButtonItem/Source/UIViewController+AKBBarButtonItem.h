//
//  UIViewController+AKBBarButtonItem.h
//  AKBBarButtonItem
//
//  Created by v on 17/3/21.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKBButton : UIButton

@property (nonatomic,assign) NSInteger badgeNumber;

@end

@interface UIViewController (AKBBarButtonItem)
///暂存按钮数据
@property (nonatomic, strong) NSMutableArray<UIBarButtonItem *> *AKBItems;

- (UIViewController *(^)(NSString *))addBarTitle;
- (UIViewController *(^)(NSArray<NSString *> *))addBarTitles;
- (UIViewController *(^)(NSString *))addBarImage;
- (UIViewController *(^)(NSArray<NSString *> *))addBarImages;
- (UIViewController *(^)(NSString *,NSString *))addBarImageAndTitle;
- (UIViewController *(^)(NSArray<NSString *> *,NSArray<NSString *> *))addBarImagesAndTitles;

- (void (^)())onBarLeft;
- (void (^)())onBarRight;

- (void)barButtonItemClick:(AKBButton *)btn;
@end
