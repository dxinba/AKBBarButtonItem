//
//  ViewController.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AKBBarButtonItems.h"

@interface ViewController ()
@property (nonatomic,assign) NSInteger badgeNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _badgeNumber=-1;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    __weak typeof(self) weaSelf=self;
    [self addWithTitle:@"返回" useBlock:^(AKBButton *btn) {
        [weaSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self addBarButtonItemWithTitle:@"返回" on:BarPositionLeft];
    [self addBarButtonItemWithImageName:@"alarm_n" on:BarPositionLeft];
    
    [self addBarButtonItemWithImageName:@"message"];
    [self addBarButtonItemWithImageName:@"star_n" title:@"收藏"];
}

-(void)barButtonItemClick:(AKBButton *)btn{
    switch (btn.tag) {
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        case 2:
            btn.selected=!btn.selected;
            [btn setBackgroundImage:btn.isSelected?[UIImage imageNamed:@"alarm_h"]:[UIImage imageNamed:@"alarm_n"] forState:UIControlStateNormal];
            break;
            
        case 10:
            btn.badgeNumber=_badgeNumber++;
            break;
            
        case 11:
            //根据状态设置，sizToFit貌似不起作用
//            [btn setImage:[UIImage imageNamed:@"star_h"] forState:UIControlStateSelected];
//            [btn setTitle:@"已收藏" forState:UIControlStateSelected];
            btn.selected=!btn.selected;
            [btn setImage:btn.isSelected?[UIImage imageNamed:@"star_h"]:[UIImage imageNamed:@"star_n"] forState:UIControlStateNormal];
            [btn setTitle:btn.isSelected?@"已收藏":@"收藏" forState:UIControlStateNormal];
            [btn sizeToFit];
            break;
            
        default:
            break;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

-(void)dealloc{
    NSLog(@"controller被销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
