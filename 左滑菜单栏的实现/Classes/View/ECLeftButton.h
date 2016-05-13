//
//  ECLeftButton.h
//  左滑菜单栏的实现
//
//  Created by Admin on 16/5/13.
//  Copyright © 2016年 EzioChiu. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ECLeftButton;
@protocol ECLeftButtonDelegate <NSObject>

@optional
-(void)leftButton:(ECLeftButton *)button selectFromIndex:(int)fromIndex toIndex:(int)toIndex;;

@end
@interface ECLeftButton : UIView

//ECLeftButton的代理方法
@property (weak,nonatomic) id <ECLeftButtonDelegate> delegate;
@end
