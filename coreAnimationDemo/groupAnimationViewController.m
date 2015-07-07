//
//  groupAnimationViewController.m
//  coreAnimationDemo
//
//  Created by Richey on 15/7/7.
//  Copyright (c) 2015年 Richey. All rights reserved.
//

#import "groupAnimationViewController.h"

@interface groupAnimationViewController ()
@property(nonatomic,strong) CALayer *groupLayer;

@end

@implementation groupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _groupLayer = [CALayer layer];
    _groupLayer.bounds = CGRectMake(0, 0, 200, 200);
    _groupLayer.backgroundColor = [[UIColor redColor] CGColor];
    _groupLayer.cornerRadius = 50;
    _groupLayer.position = self.view.center;
    [self.view.layer addSublayer:_groupLayer];

     //添加一组动画
    //1.缩放动画
    CABasicAnimation *scaleAnimtion = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimtion.duration = 2;
    scaleAnimtion.toValue = @1.5;
    scaleAnimtion.fillMode = kCAFillModeForwards;

    //2.颜色渐变
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnimation.beginTime = 0.5;
    colorAnimation.duration = 1.5;
    colorAnimation.toValue = (__bridge id)([[UIColor blueColor] CGColor]);
    colorAnimation.fillMode = kCAFillModeForwards;

    //3.旋转动画
    CABasicAnimation *rotaAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotaAnimation.beginTime = 0.5;
    rotaAnimation.duration = 0.5;
    rotaAnimation.toValue = @(M_PI_4);
    rotaAnimation.fillMode = kCAFillModeForwards;


    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scaleAnimtion,colorAnimation,rotaAnimation];
    group.duration = 2.25;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.autoreverses = YES;
    group.repeatCount = INT_MAX;



    [_groupLayer addAnimation:group forKey:nil];





}


@end
