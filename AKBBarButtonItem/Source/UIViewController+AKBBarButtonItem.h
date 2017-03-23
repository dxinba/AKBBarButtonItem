//
//  UIViewController+AKBBarButtonItem.h
//  AKBBarButtonItem
//
//  Created by v on 17/3/21.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (AKBBarButtonItem)

@property (nonatomic, strong) NSMutableArray<UIBarButtonItem *> *AKBItems;


- (UIViewController *(^)(NSString *title)) addBarTitle;
- (void (^)()) onBarLeft;
- (void (^)()) onBarRight;


@property (nonatomic, strong) UIBarButtonItem *akbItem;
- (UIViewController *(^)()) add;
- (void (^)(NSString *title)) title;
- (void (^)()) onRight;
- (void (^)(NSString *action)) withAction;
@end
