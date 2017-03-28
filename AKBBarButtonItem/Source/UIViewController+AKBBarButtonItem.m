//
//  UIViewController+AKBBarButtonItem.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/21.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBBarButtonItem.h"
#import <objc/runtime.h>

@implementation UIViewController (AKBBarButtonItem)

static const char* AKBItemsKey = "AKBItemsKey";

#pragma mark - 分类添加属性
- (NSMutableArray<UIBarButtonItem *> *)AKBItems{
    return objc_getAssociatedObject(self, AKBItemsKey);
}

- (void)setAKBItems:(NSMutableArray<UIBarButtonItem *> *)AKBItems{
    objc_setAssociatedObject(self, AKBItemsKey, AKBItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray<UIBarButtonItem *> *)AKBGetItems{
    if (self.AKBItems==nil) {
        self.AKBItems=[NSMutableArray array];
    }
    return self.AKBItems;
}

-(UIViewController *(^)(NSString *))addBarTitle{
    return ^UIViewController *(NSString *title) {
        [[self AKBGetItems] addObject:[self createBtnWithTitle:title imageName:nil]];
        return self;
    };
}

-(UIViewController *(^)(NSArray<NSString *> *))addBarTitles{
    return ^UIViewController *(NSArray<NSString *> *titles) {
        for (NSString *title in titles) {
            [[self AKBGetItems] addObject:[self createBtnWithTitle:title imageName:nil]];
        }
        return self;
    };
}

-(UIViewController *(^)(NSString *))addBarImage{
    return ^UIViewController *(NSString *image) {
        [[self AKBGetItems] addObject:[self createBtnWithTitle:nil imageName:image]];
        return self;
    };
}

-(UIViewController *(^)(NSArray<NSString *> *))addBarImages{
    return ^UIViewController *(NSArray<NSString *> *images) {
        for (NSString *image in images) {
            [[self AKBGetItems] addObject:[self createBtnWithTitle:nil imageName:image]];
        }
        return self;
    };
}

-(UIViewController *(^)(NSString *, NSString *))addBarImageAndTitle{
    return ^UIViewController *(NSString *image,NSString *title) {
        [[self AKBGetItems] addObject:[self createBtnWithTitle:title imageName:image]];
        return self;
    };
}

-(UIViewController *(^)(NSArray<NSString *> *, NSArray<NSString *> *))addBarImagesAndTitles{
    return ^UIViewController *(NSArray<NSString *> *images, NSArray<NSString *> *titles) {
        [images enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [[self AKBGetItems] addObject:[self createBtnWithTitle:titles[idx] imageName:obj]];
        }];
        return self;
    };
}

-(void (^)())onBarLeft{
    return ^(){
        [self addBarButtonItemOnLeft:YES];
    };
}

-(void (^)())onBarRight{
    return ^(){
        [self addBarButtonItemOnLeft:NO];
    };
}

#pragma mark - privte
///获得可变按钮数组，并添加间距
- (NSMutableArray<UIBarButtonItem *> *)barButtonItemsMutableCopyOnLeft:(BOOL)left {
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:left ? self.navigationItem.leftBarButtonItems : self.navigationItem.rightBarButtonItems];
    
    if (arrayM.count < 1) {//第一次添加按钮,缩小距离屏幕边缘的间距
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        space.width =- 10;
        space.tag = left ? 0 : 10;
        [arrayM addObject:space];
    }
    return arrayM;
}

///添加按钮的放入方法里调用,代码复用
- (void)addBarButtonItemOnLeft:(BOOL)left {
    NSMutableArray<UIBarButtonItem *> *arrayM=[self barButtonItemsMutableCopyOnLeft:left];
    
    for (UIBarButtonItem *item in self.AKBItems) {
        item.tag=item.customView.tag=arrayM.lastObject.tag+1;
        [arrayM addObject:item];
    }
    
    [self.AKBItems removeAllObjects];
    self.AKBItems=nil;
    
    if (left)
        self.navigationItem.leftBarButtonItems = arrayM;
    else
        self.navigationItem.rightBarButtonItems = arrayM;
    
}

#pragma mark - UIBarButtonItem
- (UIBarButtonItem *)createBtnWithTitle:(NSString *)title imageName:(NSString *)imageName {
    AKBButton *btn = [AKBButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length > 0) {//添加标题
        [btn setTitle:title forState:UIControlStateNormal];
        CGFloat size = 16.0;
        if ([UIScreen mainScreen].scale > 2.0) {//6plus
            size *= 1.5;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:size];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:.5] forState:UIControlStateHighlighted];
    }
    
    if (imageName.length > 0) {//添加图片
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    //    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);// TODO: 大小还需根据真机使用情况进行调整
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

#pragma mark - public
- (void)barButtonItemClick:(AKBButton *)btn {
    //    NSLog(@"%@",btn);
}

@end
