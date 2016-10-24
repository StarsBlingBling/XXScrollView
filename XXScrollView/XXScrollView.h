//
//  XXScrollView.h
//  XXScrollView
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 stars. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXScrollView : UIView

@property(nonatomic,strong)NSArray *imageNamesArray;

@property(nonatomic,assign)NSInteger time;

@property(nonatomic,assign)BOOL isRight;

-(void)addGestureRecognizer:(UITapGestureRecognizer *)tap WithImageNameAtIndex:(NSInteger)index;

-(void)setPageControlFrame:(CGRect)frame;

-(void)setPageControlCurrentPageIndicatorTintColor:(UIColor *)currentColor andTintColor:(UIColor *)tintColor;
@end
