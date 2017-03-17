//
//  UIViewController+AKBBarButtonItems.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBBarButtonItems.h"
#import "UIDevice+Info.h"

@implementation UIViewController (AKBBarButtonItems)

- (void)addBarButtonItemWithTitle:(NSString *)title {
    [self addBarButtonItemWithTitle:title on:BarPositionRight];
}

- (void)addBarButtonItemWithTitle:(NSString *)title on:(BarPosition)position {
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    
    [self addBarButtonItem:[self createBtnWithTitle:title imageName:nil tag:arrayM.lastObject.tag + 1] to:arrayM on:position];
}

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles {
    [self addBarButtonItemWithTitles:titles on:BarPositionRight];
}

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles on:(BarPosition)position {
    // 想直接传这个 titles 进 addBarButtonItem:to:on ，那样这个获取 arrayM 方法要写到 addBarButtonItem:to:on 里头
    // 那样 addBarButtonItem:to:on 的第一个参数要变成 id 
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    for (int i = 0; i < titles.count; i ++) {
        [self addBarButtonItem:[self createBtnWithTitle:titles[i] imageName:nil tag:arrayM.lastObject.tag + 1] to:arrayM on:position];
    }
}

#pragma mark - privte

///获得可变按钮数组，并添加间距
- (NSMutableArray<UIBarButtonItem *> *)barButtonItemsMutableCopy:(BarPosition)position {
    
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:position == BarPositionRight ? self.navigationItem.rightBarButtonItems : self.navigationItem.leftBarButtonItems];
    
    if (arrayM.count < 1) {//第一次添加按钮,缩小距离屏幕边缘的间距
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        space.width =- 10;
        space.tag = position == BarPositionRight ? 9 : 0;
        [arrayM addObject:space];
    }
    return arrayM;
}

///添加按钮的放入方法里调用,代码复用
- (void)addBarButtonItem:(id)item to:(NSMutableArray<UIBarButtonItem *> *)arrayM on:(BarPosition)position {
    //
    [arrayM addObject:item];
    
    if (position == BarPositionRight) {
        self.navigationItem.rightBarButtonItems = arrayM;
    }
    else {
        self.navigationItem.leftBarButtonItems = arrayM;
    }
}

#pragma mark - UIBarButtonItem
- (UIBarButtonItem *)createBtnWithTitle:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length > 0) {//添加标题
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [self barFont];
    }
    
    if (imageName.length > 0) {//添加图片
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);// TODO: 大小还需根据真机使用情况进行调整
    
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.tag = btn.tag = tag;
    return item;
}


- (UIFont *)barFont {
    CGFloat size = 14.0;
    if ([UIScreen mainScreen].scale > 2.0) {//6plus
        size *= 1.5;
    }
    return [UIFont systemFontOfSize:size];
}

#pragma mark - public
- (void)barButtonItemClick:(UIButton *)btn {
    NSLog(@"%@",btn);
}










// 使用Block回调（单个）
//- (void)addWithTitle:(NSString *)title useBlock:(barItemBlock)block {
//    [self addBarButtonItemWithTitle:title on:BarPositionRight];
//    // 添加Button的方法不能这么添加
//    block();
//}

@end
