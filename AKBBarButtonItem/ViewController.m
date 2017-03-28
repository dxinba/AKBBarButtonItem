//
//  ViewController.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "ViewController.h"
//#import "UIViewController+AKBBarButtonItems.h"
#import "UIViewController+AKBBarButtonItem.h"
@interface ViewController ()
@property (nonatomic,assign) NSInteger badgeNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.addBarImagesAndTitles(@[@"star_h",@"alarm_h"],@[@"zxv",@"asd"]).onBarLeft();
    self.addBarImagesAndTitles(@[@"star_h",@"alarm_h"],@[@"zxv",@"asd"]).onBarRight();
//    self.addBarTitle(@"zcv").addBarImage(@"star_h").onBarLeft();
//    self.addBarTitle(@"asd").addBarImage(@"alarm_h").onBarRight();
//    self.addBarTitles(@[@"zcv",@"asd"]).onBarLeft();
//    self.addBarImages(@[@"star_h",@"alarm_h"]).onBarRight();
//    _badgeNumber=-1;
//    
//    [self addBarButtonItemWithTitle:@"返回" on:BarPositionLeft];
//    [self addBarButtonItemWithImageName:@"alarm_n" on:BarPositionLeft];
//    
//    [self addBarButtonItemWithImageName:@"message"];
//    [self addBarButtonItemWithImageName:@"star_n" title:@"收藏"];
//    
//    NSLog(@"%@",[self barButtonWithTag:11].currentTitle);
    
//    self.addBarTitle(@"ad").onBarLeft();
    
    
    
    
    
    
//    [self addWithTitle:@"pupu" useBlock:^(AKBButton *btn) {
//        NSLog(@"123");
//    }];
}

-(void)barButtonItemClick:(AKBButton *)btn{
    NSLog(@"%@",btn);
    [self.navigationController popViewControllerAnimated:YES];
}
//    switch (btn.tag) {
//        case 1:
//            [self.navigationController popViewControllerAnimated:YES];
//            break;
//            
//        case 2:
//            btn.selected=!btn.selected;
//            [btn setBackgroundImage:btn.isSelected?[UIImage imageNamed:@"alarm_h"]:[UIImage imageNamed:@"alarm_n"] forState:UIControlStateNormal];
//            break;
//            
//        case 10:
//            btn.badgeNumber=_badgeNumber++;
//            break;
//            
//        case 11:
//            //根据状态设置，sizToFit貌似不起作用
////            [btn setImage:[UIImage imageNamed:@"star_h"] forState:UIControlStateSelected];
////            [btn setTitle:@"已收藏" forState:UIControlStateSelected];
//            btn.selected=!btn.selected;
//            [btn setImage:btn.isSelected?[UIImage imageNamed:@"star_h"]:[UIImage imageNamed:@"star_n"] forState:UIControlStateNormal];
//            [btn setTitle:btn.isSelected?@"已收藏":@"收藏" forState:UIControlStateNormal];
//            [btn sizeToFit];
//            break;
//            
//        default:
//            break;
//    }
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self removeBarButtonWithTag:11];
    
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
