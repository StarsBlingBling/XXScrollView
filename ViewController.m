//
//  ViewController.m
//  XXScrollView
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 stars. All rights reserved.
//

#import "ViewController.h"
#import "XXScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XXScrollView *manager = [[XXScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    
    manager.time = 1;
    
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"5", nil];
    manager.imageNamesArray = arr;
    
    manager.isRight = YES;
    
    [self.view addSubview:manager];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)];
    
    [manager addGestureRecognizer:tap WithImageNameAtIndex:1];
    
    [manager setPageControlCurrentPageIndicatorTintColor:[UIColor redColor] andTintColor:[UIColor yellowColor]];
}
    

-(void)test{
    NSLog(@"xxx");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
