//
//  UIViewController+AKBLeftBarButton.h
//  AKBBarButtonItem
//
//  Created by v on 17/3/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AKBLeftBarButton)

- (void)setCustomerViewAction:(SEL)action imageName:(NSString *)imageName andTag:(NSInteger)tag;

@end
