//
//  FirstViewController.m
//  QQMusicDemo
//
//  Created by 宋志明 on 15/12/8.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TransitionFromFirstToSecond.h"
#import "TransitionFromSecondToFirst.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconImageView.layer.cornerRadius = 20;
    self.iconImageView.layer.masksToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.iconImageView addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark 图片点击事件
- (void)tap
{
    SecondViewController *vc = [[SecondViewController alloc]init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[TransitionFromSecondToFirst alloc] init];
}

@end

