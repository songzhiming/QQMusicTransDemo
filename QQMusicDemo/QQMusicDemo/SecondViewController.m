//
//  SecondViewController.m
//  QQMusicDemo
//
//  Created by 宋志明 on 15/12/8.
//  Copyright © 2015年 宋志明. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    self.iconImageView.layer.cornerRadius = 100;
    self.iconImageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
