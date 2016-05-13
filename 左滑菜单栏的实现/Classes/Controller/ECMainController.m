//
//  ViewController.m
//  左滑菜单栏的实现
//
//  Created by Admin on 16/5/13.
//  Copyright © 2016年 EzioChiu. All rights reserved.
//

#import "ECMainController.h"
#import "ECNavigationController.h"
#import "ECLeftButton.h"
#import "ECTitleButton.h"
#import "EC111ViewController.h"

@interface ECMainController () <ECLeftButtonDelegate>
@property (nonatomic, weak) ECNavigationController *showingNavigationController;
@end
#define NavShowAnimDuration 0.25

@implementation ECMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建子控制器
    // 1.1.111控制器
    EC111ViewController *news = [[EC111ViewController alloc] init];
    [self setupVc:news title:@"哈哈哈哈哈"];
    
    // 1.2.222控制器
    UIViewController *reading = [[UIViewController alloc] init];
    [self setupVc:reading title:@"222"];
    
    // 1.3.333控制器
    UIViewController *photo = [[UIViewController alloc] init];
    [self setupVc:photo title:@"333"];
    
    // 1.4.444控制器
    UIViewController *video = [[UIViewController alloc] init];
    [self setupVc:video title:@"444"];
    
    // 1.5.555控制器
    UIViewController *comment = [[UIViewController alloc] init];
    [self setupVc:comment title:@"555"];
    
    // 1.6.666控制器
    UIViewController *radio = [[UIViewController alloc] init];
    [self setupVc:radio title:@"666"];
    
    // 2.添加左菜单
    ECLeftButton *leftMenu = [[ECLeftButton alloc] init];
    leftMenu.delegate = self;
    leftMenu.height = 300;
    leftMenu.width = 200;
    leftMenu.y = 60;
    [self.view insertSubview:leftMenu atIndex:1];
    
    //添加rightSwipe手势
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    //添加leftSwipe手势
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
}
- (void)setupVc:(UIViewController *)vc title:(NSString *)title
{
    // 1.设置背景色
    vc.view.backgroundColor = HMRandomColor;
    
    // 2.设置标题
    ECTitleButton *titleView = [[ECTitleButton alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    // 3.设置左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIconClick" target:self action:@selector(leftBtn)];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon-click" target:self action:@selector(rightBtn)];
    
    // 4.包装一个导航控制器
    ECNavigationController *nav = [[ECNavigationController alloc] initWithRootViewController:vc];
    // 让newsNav成为self（HMMainViewController）的子控制器，能保证：self在，newsNav就在
    // 如果两个控制器互为父子关系，那么它们的view也应该互为父子关系
    [self addChildViewController:nav];
}

- (void)leftBtn
{
    NSLog(@"leftBtn---");
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        //        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * 60;
        CGFloat navH = [UIScreen mainScreen].bounds.size.height;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        //        菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = 220 - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        //        CGFloat translateY = topMargin - 60;
        CGFloat translateY = topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY / scale);
        [UIView animateWithDuration:NavShowAnimDuration animations:^{
            self.showingNavigationController.view.transform = CGAffineTransformIdentity;
        } completion:nil];
        showingView.transform = translateForm;
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
}

- (void)rightBtn
{
    NSLog(@"rightMenu");
}

- (void)coverClick:(UIButton *)cover
{
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}

-(void)rightSwipe:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"rightSwipe---");
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        //        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * 60;
        CGFloat navH = [UIScreen mainScreen].bounds.size.height;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单右边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = 220 - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        //        CGFloat translateY = topMargin - 60;
        CGFloat translateY = topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY / scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
    
}
#pragma mark - 实现leftSwipe手势
-(void)leftSwipe:(UISwipeGestureRecognizer *)swipe
{
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        UIView *showingView = self.showingNavigationController.view;
        showingView.transform = CGAffineTransformIdentity;
    }];
}

-(void)leftButton:(ECLeftButton *)button selectFromIndex:(int)fromIndex toIndex:(int)toIndex
{
    // 0.移除旧控制器的view
    ECNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 1.显示新控制器的view
    ECNavigationController *newNav = self.childViewControllers[toIndex];
    // 设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    // 设置阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    [self.view addSubview:newNav.view];
    
    // 2.设置当前正在显示的控制器
    self.showingNavigationController = newNav;
    
    // 3.清空transform
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        newNav.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
