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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addBarButtonItemWithTitle:@"a"];
    [self addBarButtonItemWithTitle:@"b"];
    [self addBarButtonItemWithTitle:@"c"];
    [self addBarButtonItemWithTitle:@"d"];
    
    [self addBarButtonItemWithTitle:@"1" on:BarPositionLeft];
    [self addBarButtonItemWithTitle:@"2" on:BarPositionLeft];
    [self addBarButtonItemWithTitle:@"3" on:BarPositionLeft];
    [self addBarButtonItemWithTitle:@"4" on:BarPositionLeft];
}

-(void)barButtonItemClick:(UIButton *)btn{
    NSLog(@"%zi",btn.tag);
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
