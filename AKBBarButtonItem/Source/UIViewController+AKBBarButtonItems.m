//
//  UIViewController+AKBBarButtonItems.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/15.
//  Copyright © 2017年 v. All rights reserved.
//

#import "UIViewController+AKBBarButtonItems.h"

@implementation UIViewController (AKBBarButtonItems)

-(void)addBarButtonItemWithTitle:(NSString *)title{
    [self addBarButtonItemWithTitle:title position:BarPositionRight];
}

-(void)addBarButtonItemWithTitle:(NSString *)title position:(BarPosition)position{
    if (position==BarPositionRight) {
        NSMutableArray<UIBarButtonItem *> *arrayM=[NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
        
        [arrayM addObject:[self createBtnWithTitle:title imageName:nil tag:arrayM.count==0?10:arrayM.lastObject.tag+1]];
        
        self.navigationItem.rightBarButtonItems=arrayM;
    }
    else {
        NSMutableArray<UIBarButtonItem *> *arrayM=[NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
        
        [arrayM addObject:[self createBtnWithTitle:title imageName:nil tag:arrayM.lastObject.tag+1]];
        
        self.navigationItem.leftBarButtonItems=arrayM;
    }
}

#pragma mark - UIBarButtonItem
-(UIBarButtonItem *)createBtnWithTitle:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length>0) {//添加标题
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (imageName.length>0) {//添加图片
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    btn.tag=tag;//添加tag
    
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:btn];
    item.tag=tag;
    return item;
}

-(void)barButtonItemClick:(UIButton *)btn{
    NSLog(@"%@",btn);
}

@end
