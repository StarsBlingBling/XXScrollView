//
//  XXScrollView.m
//  XXScrollView
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 stars. All rights reserved.
//

#import "XXScrollView.h"

@interface XXScrollView ()

{
    NSTimer *_timer;
}

@property(nonatomic,weak)UIScrollView *advertisingView;

@property (weak, nonatomic) UIPageControl *pageControl;

@end
@implementation XXScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIScrollView *view = [[UIScrollView alloc] initWithFrame:self.bounds];
        view.delegate = self;
        view.pagingEnabled = YES;
        
        [self addSubview:view];
        
        _advertisingView = view;
        
        
    }
    return self;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(self.advertisingView.frame.size.width - 100, self.advertisingView.frame.size.height - 50, 100, 50)];
        
        page.currentPage = 0;
        
        page.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        [self addSubview:page];
        _pageControl = page;
    }
    return _pageControl;
}

-(void)setImageNamesArray:(NSArray *)imageNamesArray{
    _imageNamesArray = imageNamesArray;
    
    self.pageControl.numberOfPages = imageNamesArray.count;
    
    if (imageNamesArray.count == 0) {
        return;
    }
    else{
        [self addFirstImageAndLastImage:imageNamesArray];
    }
    
}

-(void)addFirstImageAndLastImage:(NSArray *)imageNamesArray{
    NSString *firstImageName = imageNamesArray.firstObject;
    NSString *lasstImageName = imageNamesArray.lastObject;
    
    NSMutableArray *imageNames = [NSMutableArray array];
    
    [imageNames addObject:lasstImageName];
    [imageNames addObjectsFromArray:imageNamesArray];
    [imageNames addObject:firstImageName];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    for (int i = 0; i < imageNames.count; i++) {
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.userInteractionEnabled = YES;
        
        imageView.tag = i + 1000;
        
        
        [self.advertisingView addSubview:imageView];
        
    }
    self.advertisingView.contentSize = CGSizeMake(width * imageNames.count, height);
    
    CGPoint offset = CGPointMake(self.advertisingView.frame.size.width, 0);
    [self.advertisingView setContentOffset:offset animated:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self bringSubviewToFront:self.pageControl];
    });
}


-(void)setTime:(NSInteger)time{
    _time = time;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_time target:self selector:@selector(changeOffset) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
}

-(void)changeOffset{
    CGPoint offset = self.advertisingView.contentOffset;
    
    if (_isRight) {
        offset.x -= self.frame.size.width;
    }else{
        offset.x += self.frame.size.width;
    }
    
    [self.advertisingView setContentOffset:offset animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = self.advertisingView.contentOffset;
    if (offset.x >= self.advertisingView.contentSize.width - self.frame.size.width) {
        offset.x = self.frame.size.width;
        [self.advertisingView setContentOffset:offset animated:NO];
    }
    else if (offset.x <= 0)
    {
        offset.x = self.advertisingView.contentSize.width - 2 * self.frame.size.width;
        [self.advertisingView setContentOffset:offset animated:NO];
    }
    
    NSInteger page = offset.x / self.advertisingView.frame.size.width;
    
    self.pageControl.currentPage = page - 1;
    
}

-(void)addGestureRecognizer:(UITapGestureRecognizer *)tap WithImageNameAtIndex:(NSInteger)index{
    
    UIImageView *view = [self viewWithTag:index + 1000 + 1];
    
    [view addGestureRecognizer:tap];
    
}

-(void)setPageControlFrame:(CGRect)frame{
    self.pageControl.frame = frame;
}

-(void)setPageControlCurrentPageIndicatorTintColor:(UIColor *)currentColor andTintColor:(UIColor *)tintColor{
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    self.pageControl.pageIndicatorTintColor = tintColor;
}


@end
