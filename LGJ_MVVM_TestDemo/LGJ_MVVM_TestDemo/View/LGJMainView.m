//
//  LGJMainView.m
//  ChangeBlockInstanceTestDemo
//
//  Created by 劉光軍 on 2017/7/22.
//  Copyright © 2017年 劉光軍. All rights reserved.
//

#import "LGJMainView.h"
#import "SectionModel.h"
#import "RowModel.h"
#import "LGJCell.h"


#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface LGJMainView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) LGJMainViewModel *viewModel;

@end

@implementation LGJMainView


- (instancetype)initWithViewModel:(LGJMainViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
        [self configView];
    }
    return self;
}

- (void)configView {
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self addSubview:self.mainTableView];
}

#pragma mark - tableView delegate&dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel getSectionCount];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionModel *sectionModel = [self.viewModel getSectionModelWithSection:section];
    UILabel *headerLabel = [self configHeader];
    headerLabel.text = [NSString stringWithFormat:@"我是第%@个section", sectionModel.sectionName];
    return headerLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel getCellCountWithIndexPath:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *idStr = @"LGJCell";
    LGJCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell) {
        cell = [[LGJCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    cell.cellModel = [self.viewModel getRowModelWithIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel changeCellModelWithIndexPath:indexPath];
    [tableView reloadData];
}

#pragma mark - coustom tableViewHeader 
- (UILabel *)configHeader {
    UILabel *headerLabel = [UILabel new];
    headerLabel.backgroundColor = [UIColor whiteColor];
    headerLabel.font = [UIFont systemFontOfSize:14];
    headerLabel.textColor = [UIColor redColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    return headerLabel;
}

@end
