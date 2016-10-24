# XXScrollView
##介绍:
对ScrollView的封装，简单实现了广告页面的轮播效果，也提供了单个视图的方法添加

##使用方法:
#### 三个属性:
- 首先需要提供一个图片名字的数组:   NSArray *imageNamesArray
- 设置轮番滚动定时器的时间:   NSInteger time(单位:秒)
- 是否向右滚动(如不设置，默认向左):   BOOL isRight


#### 三个方法:
##### 1 这个方法用来为某个视图添加手势方法;(注意哟，视图的下标和你之前提供的图片名字下标是对应的(从0开始))
--(void)addGestureRecognizer:(UITapGestureRecognizer *)tap WithImageNameAtIndex:(NSInteger)index;

##### 2 这个方法用来设置PageController的坐标(如不设置，默认是右下角)
-(void)setPageControlFrame:(CGRect)frame;

##### 3 这个方法用来设置PageController的当前选中颜色以及未选中时的颜色(如不设置，默认选中颜色为白色，未选中为透明色)
-(void)setPageControlCurrentPageIndicatorTintColor:(UIColor *)currentColor andTintColor:(UIColor *)tintColor;

##效果展示:
- 当设置为向右滚动时：
manager.isRight = YES;


![滚动视图右滑.gif](http://upload-images.jianshu.io/upload_images/3101006-49c9b21814238d3f.gif?imageMogr2/auto-orient/strip)

- 当设置为向左滚动时：

manager.isRight = NO;




![滚动视图左滑.gif](http://upload-images.jianshu.io/upload_images/3101006-fa49a41c09d96d96.gif?imageMogr2/auto-orient/strip)



- 默认PageControll颜色:



![屏幕快照 2016-10-24 下午8.21.26.png](http://upload-images.jianshu.io/upload_images/3101006-68f5c5f3e96e5376.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



- 设置PageControll颜色:

[manager setPageControlCurrentPageIndicatorTintColor:[UIColor redColor] andTintColor:[UIColor yellowColor]];





![屏幕快照 2016-10-24 下午8.23.15.png](http://upload-images.jianshu.io/upload_images/3101006-498dba3d483571e2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 给某个视图添加手势:

UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)];
    [manager addGestureRecognizer:tap WithImageNameAtIndex:1];
 //注意哟，视图的下标和你之前提供的图片名字下标是对应的(从0开始)
-(void)test{
    NSLog(@"xxx");
}

当点击视图1的时候就会触发该方法啦！！




![点击相应事件.gif](http://upload-images.jianshu.io/upload_images/3101006-7d9e103edacb11d5.gif?imageMogr2/auto-orient/strip)
