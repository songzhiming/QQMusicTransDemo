//
//  TransitionFromSecondToFirst.m
//  QQMusicDemo
//
//  Created by 宋志明 on 15/12/8.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import "TransitionFromSecondToFirst.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@implementation TransitionFromSecondToFirst
#pragma mark 转场动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}
#pragma mark 执行的动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //获取第一个控制器
    SecondViewController *firstVc = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //获取第二个控制器
    FirstViewController *secondVc = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //
    UIView *containerView = [transitionContext containerView];
    //时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    UIView *firstImageSnapShot = [firstVc.iconImageView snapshotViewAfterScreenUpdates:YES];
    NSLog(@"firstImageSnapShot====%@",firstImageSnapShot);
    
    
    firstImageSnapShot.frame = [containerView convertRect:firstVc.iconImageView.frame fromView:firstVc.view];
    NSLog(@"firstImageSnapShot====%@",firstImageSnapShot);
    firstVc.iconImageView.hidden = YES;
    
    
    
    
    secondVc.view.frame = [transitionContext finalFrameForViewController:secondVc];
    secondVc.view.alpha = 0;
    secondVc.iconImageView.hidden = YES;
    
    
    [containerView addSubview:secondVc.view];
    [containerView addSubview:firstImageSnapShot];
    
    
    [UIView animateWithDuration:duration animations:^{
        secondVc.view.alpha = 1.0;
        
        CGRect frame = [containerView convertRect:secondVc.iconImageView.frame fromView:secondVc.bottomView];
        
        
        firstImageSnapShot.frame = frame;
    } completion:^(BOOL finished) {
        
        secondVc.iconImageView.hidden = NO;
        firstVc.iconImageView.hidden = NO;
        [firstImageSnapShot removeFromSuperview];
        
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
    
}

@end
