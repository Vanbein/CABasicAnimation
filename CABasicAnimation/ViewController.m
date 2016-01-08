//
//  ViewController.m
//  CABasicAnimation
//
//  Created by 王斌 on 16/1/6.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    
    UIView *view10;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //心跳
    [self initScaleLayer];

    /******* 一些常用的动画 *******/
    //1. 缩放动画
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(15, 40, 30, 30)];
    [view setBackgroundColor:[UIColor redColor]];
    view.layer.cornerRadius = 5;
    [view.layer addAnimation:[CustomAnimation animationScaleWithOrigin:1.0 Multiple:1.4 duration:0.7 RepeatTimes:MAXFLOAT] forKey:nil];
    [self.view addSubview:view];

    
    //2. 横向移动
    UIImageView *view2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 80, 50, 50)];
    [view2 setImage:[UIImage imageNamed:@"500"]];
    view2.layer.cornerRadius = 6;
    view2.layer.masksToBounds = YES;
    [view2.layer addAnimation:[CustomAnimation animationMoveXWithDuration:1.5 X:250] forKey:nil];
    [self.view addSubview:view2];
    
    //3. 纵向移动
    UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(15, 90, 50, 50)];
    [view5 setBackgroundColor:[UIColor purpleColor]];
    [view5.layer addAnimation:[CustomAnimation animationMoveYWithDuration:1.5 Y:250] forKey:nil];
    [self.view addSubview:view5];

//    //4. 点移动
//    UIView *view6 = [[UIView alloc]initWithFrame:CGRectMake(30, 105, 30, 30)];
//    [view6 setBackgroundColor:[UIColor blackColor]];
//    view6.layer.cornerRadius = 15;
//    [view6.layer addAnimation:[CustomAnimation animationMovePoint:CGPointMake(150, 250) duration:1.5] forKey:nil];
//    [self.view addSubview:view6];
//
    //4. 添加点移动
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(20, 500, 80, 30)];
    [button1 setBackgroundColor:[UIColor orangeColor]];
    button1.layer.cornerRadius = 8;
    button1.layer.masksToBounds = YES;
    [button1 setTitle:@"点移动" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(addView_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    

    
    //5. 永久闪烁
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(70, 40, 30, 30)];
    [view3 setBackgroundColor:[UIColor greenColor]];
    view3.layer.cornerRadius = 15;
    [view3.layer addAnimation:[CustomAnimation animationOpacityForeverWithDuration:0.8] forKey:nil];
    [self.view addSubview:view3];

    //6. 有次数闪烁
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(120, 40, 30, 30)];
    [view4 setBackgroundColor:[UIColor purpleColor]];
    view4.layer.cornerRadius = 15;
    [view4.layer addAnimation:[CustomAnimation animationOpacityTimesWithRepeatTimes:20 duration:0.6] forKey:nil];
    [self.view addSubview:view4];

    //7. 平面旋转
    UIImageView *view6 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 250, 150, 150)];
    [view6 setImage:[UIImage imageNamed:@"500"]];
    view6.layer.cornerRadius = 75;
    view6.layer.masksToBounds = YES;
    
    CABasicAnimation *rotationAnimation = [CustomAnimation animationRotationWithDegree: M_PI duration:10.0 direction:2 repeatCount:MAXFLOAT];
    //CABasicAnimation *moveXAnimation = [CustomAnimation animationMoveXWithDuration:1.0 X:200];
    //CABasicAnimation *scaleAnimation = [CustomAnimation animationScaleWithOrigin:1.0 Multiple:0.1 duration:1.0 RepeatTimes:1];
    
    //[view6.layer addAnimation:[CustomAnimation animationGroupWithAnimationArray:@[rotationAnimation, moveXAnimation, scaleAnimation] duration:1.0 repeatTimes:MAXFLOAT] forKey:nil];
    [view6.layer addAnimation:rotationAnimation forKey:nil];
    
    [self.view addSubview:view6];
    
    //8. 圆周动画
    UIView *view7 = [[UIView alloc]initWithFrame:CGRectMake(200, 540, 30, 30)];
    [view7 setBackgroundColor:[UIColor purpleColor]];
    view7.layer.cornerRadius = 15;
    [view7.layer addAnimation:[self doAnimation] forKey:nil];
    [self.view addSubview:view7];
    
    
//    [self addAnimationWithKeyPath:@"transform.scale" forView:view];

//    [self addAnimationWithKeyPath:@"transform.translation.z" forView:view];

//    [self addAnimationWithKeyPath:@"translation.scale" forView:self.view];
    
//    [self addRectRunAnimationWithKeyPath:@"position" forView:view];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加动画

- (void)addView_1{
    
    [view10 removeFromSuperview];
    
    //4. 点移动
    view10 = [[UIView alloc]initWithFrame:CGRectMake(30, 105, 30, 30)];
    [view10 setBackgroundColor:[UIColor blackColor]];
    view10.layer.cornerRadius = 15;
    [view10.layer addAnimation:[CustomAnimation animationMovePoint:CGPointMake(200, 300) duration:1.5] forKey:nil];
    [self.view addSubview:view10];
    
}


- (void)initScaleLayer
{
    //演员初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(100, 160, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    //
    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = 10;
    scaleAnimation.duration = 0.6;
    //
    //设置代理: 设置动画的代理，可以监听动画的执行过程，这里设置控制器为代理。
    scaleAnimation.delegate = self;
    //
    //开演
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}


- (void)addRectRunAnimationWithKeyPath:(NSString *)keyPath forView:(UIView *)view{
    
//    CALayer *rectLayer = [[CALayer alloc] init];
//    rectLayer.frame = CGRectMake(15, 200, 30, 30);
//    rectLayer.cornerRadius = 15;
//    rectLayer.backgroundColor = [UIColor orangeColor].CGColor;
//    [self.view.layer addSublayer:rectLayer];

    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //关键帧位置
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:view.layer.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15, view.layer.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15, view.layer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:CGPointMake(15, view.layer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:view.layer.frame.origin]];
    
    //设置每个关键帧的时长，
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.5],
                                  [NSNumber numberWithFloat:0.8],
                                  [NSNumber numberWithFloat:1]];
    
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    rectRunAnimation.repeatCount = 1000;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    [view.layer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];

}

- (CAKeyframeAnimation *) doAnimation {
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount=HUGE_VALF;// repeat forever
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 51.2 , 18.4 );
    
    //增加4个二阶贝塞尔曲线
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 31.2, 18.4, 31.2, 38.4);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 31.0, 58.4, 51.2, 58.4);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 71.2, 58.4, 71.2, 38.4);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 71.2, 18.4, 51.2, 18.4);
    
    animation.path=curvedPath;
    
    return animation;
}

//代理方法
#pragma mark - Animation Delegate
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始执行动画");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //动画执行完毕，
    NSLog(@"动画执行完毕");
}


@end
