//
//  TransitionViewController.m
//  coreAnimationDemo
//
//  Created by Richey on 15/7/7.
//  Copyright (c) 2015年 Richey. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@property(nonatomic,strong) CALayer *containerLayer;
@property(nonatomic,strong) CALayer *redLayer;
@property(nonatomic,strong) CALayer *blueLayer;
@property(nonatomic,strong) UISegmentedControl *type;
@property(nonatomic,strong) UISegmentedControl *subType;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, 240, 240);

    _containerLayer = [CALayer layer];
    _containerLayer.position = self.view.center;
    _containerLayer.bounds = rect;
    [self.view.layer  addSublayer:_containerLayer];

    _redLayer = [CALayer layer];
    _redLayer.backgroundColor = [[UIColor redColor] CGColor];
    _redLayer.position = CGPointMake(120, 120);
    _redLayer.bounds = rect;
    _redLayer.hidden = YES;
    _redLayer.cornerRadius = 50;
    [_containerLayer addSublayer:_redLayer];

    _blueLayer = [CALayer layer];
    _blueLayer.backgroundColor = [[UIColor blueColor] CGColor];
    _blueLayer.position = CGPointMake(120, 120);
    _blueLayer.bounds = rect;
    _blueLayer.hidden = NO;
    _blueLayer.cornerRadius = 50;
    [_containerLayer addSublayer:_blueLayer];



    _type = [[UISegmentedControl alloc]initWithItems:@[@"Fade",@"Moveln",@"Push",@"Reveal"]];
    _type.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 44);
    [self.view addSubview:_type];

    _subType = [[UISegmentedControl alloc]initWithItems:@[@"Right",@"Left",@"Top",@"Bottom"]];
    _subType.frame = CGRectMake(10, 150, self.view.frame.size.width-20, 44);
    [self.view addSubview:_subType];


    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 100, 44)];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"Transtion" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actiondo) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];

}
-(void)actiondo
{
    CATransition *transition = [CATransition animation];

    NSArray *types = @[kCATransitionFade,kCATransitionMoveIn,kCATransitionPush,kCATransitionReveal];
    NSArray *subtypes = @[kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom];

    transition.type = types[_type.selectedSegmentIndex];
    transition.subtype = subtypes[_subType.selectedSegmentIndex];

    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_containerLayer addAnimation:transition forKey:@"transition"];

    _redLayer.hidden = !_redLayer.hidden;
    _blueLayer.hidden = !_blueLayer.hidden;





}


@end
