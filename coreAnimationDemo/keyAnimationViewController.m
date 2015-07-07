//
//  keyAnimationViewController.m
//  coreAnimationDemo
//
//  Created by Richey on 15/7/7.
//  Copyright (c) 2015年 Richey. All rights reserved.
//

#import "keyAnimationViewController.h"

@interface keyAnimationViewController ()

@property(nonatomic,strong) CALayer *platforLayer;
@property(nonatomic,strong) CALayer *marioLayer;

@end

@implementation keyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _platforLayer = [CALayer layer];
    _platforLayer.backgroundColor = [[UIColor brownColor] CGColor];
    _platforLayer.anchorPoint = CGPointZero;
    _platforLayer.frame = CGRectMake(160, 200, 160, 44);
    _platforLayer.cornerRadius = 4;

    _marioLayer = [CALayer layer];
    _marioLayer.contents = (__bridge id)[UIImage imageNamed:@"Mario"].CGImage;
    _marioLayer.bounds = CGRectMake(0, 0, 32, 64);
    _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    _marioLayer.anchorPoint = CGPointMake(0, 1);
    _marioLayer.position = CGPointMake(0, self.view.bounds.size.height);

    [self.view.layer addSublayer:_platforLayer];
    [self.view.layer addSublayer:_marioLayer];


    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 500, 100, 44)];
    [button setTitle:@"Jump" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchDown];

    [self.view addSubview:button];


}

-(void)action
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _marioLayer.contentsRect = CGRectMake(0, 0, 0.5, 1);
    [CATransaction commit];

    [CATransaction setCompletionBlock:^{
        [CATransaction setDisableActions:YES];
        _marioLayer.position = CGPointMake(170, 200);
        _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    }];

    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.view.bounds.size.height);
    CGPathAddCurveToPoint(path, NULL, 30, 140, 170, 140, 170, 200);

    //创建关键帧动画
    CAKeyframeAnimation *jumpAmimtion = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    jumpAmimtion.duration = 1;
    jumpAmimtion.path = path;
    jumpAmimtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [_marioLayer addAnimation:jumpAmimtion forKey:@"marioJump"];

    [CATransaction commit];


}
@end








