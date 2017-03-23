//
//  UIViewController+AKBBarButtonItem.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/21.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBBarButtonItem.h"

@implementation UIViewController (AKBBarButtonItem)

static const char* akbwhat = "akbwhat";
#pragma mark - 分类添加属性
- (NSMutableArray<UIBarButtonItem *> *)AKBItems{
    return objc_getAssociatedObject(self, akbwhat);
}

- (void)setAKBItems:(NSMutableArray<UIBarButtonItem *> *)AKBItems{
    objc_setAssociatedObject(self, akbwhat, AKBItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *(^)(NSString *title)) addBarTitle {
    return ^UIViewController *(NSString *title) {
        if (self.AKBItems==nil) {
            self.AKBItems=[NSMutableArray array];
        }
        [self.AKBItems addObject:[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:@selector(akbAction)]];
        return self;
    };
}

- (void (^)()) onBarLeft{
    return ^void() {
        NSMutableArray<UIBarButtonItem *> *items = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
        [items addObjectsFromArray:self.AKBItems];
        self.navigationItem.leftBarButtonItems = self.AKBItems;
    };
}

- (void (^)()) onBarRight{
    return ^void() {
        NSMutableArray<UIBarButtonItem *> *items = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
        [items addObjectsFromArray:self.AKBItems];
        self.navigationItem.rightBarButtonItems = self.AKBItems;
    };
}

- (void)akbAction {
    
}





- (UIBarButtonItem *)akbItem {
    return objc_getAssociatedObject(self, akbwhat);
}

- (void)setAkbItem:(UIBarButtonItem *)akbItem {
    objc_setAssociatedObject(self, akbwhat, akbItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *(^)()) add {
    return ^UIViewController *() {
        self.akbItem = [[UIBarButtonItem alloc]initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:nil];
        return self;
    };
}

- (void (^)(NSString *title)) title{
    return ^void(NSString *title) {
        self.akbItem.title = title;
    };
}


- (void (^)()) onRight{
    return ^void() {
        self.navigationItem.rightBarButtonItem = self.akbItem;
    };
}

- (void (^)(NSString *action)) withAction {
    return ^void(NSString *action) {
        self.akbItem.action = @selector(action);
    };
}

- (void)aaa {
    NSLog(@"");
}
    

@end
