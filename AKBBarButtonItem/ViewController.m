//
//  ViewController.m
//  AKBBarButtonItem
//
//  Created by v on 17/3/14.
//  Copyright © 2017年 v. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AKBLeftBarButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setCustomerViewAction:@selector(aaa) imageName:@"sm" andTag:1];

}

- (void)aaa {
    NSLog(@"123");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
