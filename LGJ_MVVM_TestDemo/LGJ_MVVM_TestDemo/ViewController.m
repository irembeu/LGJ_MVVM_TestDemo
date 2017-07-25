//
//  ViewController.m
//  LGJ_MVVM_TestDemo
//
//  Created by 劉光軍 on 2017/7/25.
//  Copyright © 2017年 劉光軍. All rights reserved.
//

#import "ViewController.h"
#import "LGJMainView.h"
#import "LGJMainViewModel.h"

@interface ViewController ()

@property(nonatomic, strong) LGJMainView *mainView;
@property (nonatomic, strong) LGJMainViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewModel = [LGJMainViewModel new];
    [self configMainView];
    
}

#pragma mark - configView
- (void)configMainView {
    
    self.mainView = [[LGJMainView alloc] initWithViewModel:self.viewModel];
    self.mainView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.mainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
