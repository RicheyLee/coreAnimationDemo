//
//  basicAnimationViewController.m
//  coreAnimationDemo
//
//  Created by Richey on 15/7/7.
//  Copyright (c) 2015年 Richey. All rights reserved.
//

#import "basicAnimationViewController.h"

@interface basicAnimationViewController ()
@property(nonatomic,strong) CALayer *basicLayer;


@end

@implementation basicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _basicLayer = [CALayer layer];
    _basicLayer.backgroundColor = [[UIColor redColor] CGColor];
    _basicLayer.cornerRadius = 50;
    _basicLayer.bounds = CGRectMake(0, 0, 200, 200);
    _basicLayer.position = self.view.center;
    [self.view.layer addSublayer:_basicLayer];


    CABasicAnimation *animtion = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animtion.toValue = @1.5;//缩放比例
    animtion.duration  = 0.5;//持续时间
    animtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//动画类型
    animtion.autoreverses = YES;
    animtion.repeatCount = INT_MAX;//重复次数

    [_basicLayer addAnimation:animtion forKey:nil];


}



@end
