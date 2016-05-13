//
//  UIBarButtonItem+Extension.h
//  左滑菜单栏的实现
//
//  Created by Admin on 16/5/13.
//  Copyright © 2016年 EzioChiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
@end
