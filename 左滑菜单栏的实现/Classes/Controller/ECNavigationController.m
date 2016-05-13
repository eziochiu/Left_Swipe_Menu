//
//  ECNavigationController.m
//  左滑菜单栏的实现
//
//  Created by Admin on 16/5/13.
//  Copyright © 2016年 EzioChiu. All rights reserved.
//

#import "ECNavigationController.h"

@interface ECNavigationController ()

@end

@implementation ECNavigationController

+ (void)initialize
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置导航栏颜色
    [appearance setBackgroundColor:[UIColor colorWithRed:0.392 green:0.363 blue:0.410 alpha:1.000]];
}

@end
