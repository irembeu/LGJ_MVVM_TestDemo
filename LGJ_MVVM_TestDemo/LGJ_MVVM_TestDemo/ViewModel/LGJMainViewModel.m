//
//  LGJMainViewModel.m
//  ChangeBlockInstanceTestDemo
//
//  Created by 劉光軍 on 2017/7/22.
//  Copyright © 2017年 劉光軍. All rights reserved.
//

#import "LGJMainViewModel.h"
#import "SectionModel.h"
#import "RowModel.h"

@interface LGJMainViewModel ()

@property (nonatomic, strong) NSMutableArray *listArr;//盛放所有model的数组
@property (nonatomic, strong) RowModel *oldRowModel;

@end

@implementation LGJMainViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self configModelArr];
    }
    return self;
}

- (void)configModelArr {
    
    self.listArr = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        SectionModel *model = [SectionModel new];
        model.sectionName = [NSString stringWithFormat:@"%d", i];
        NSMutableArray *mutArr = [NSMutableArray array];
        for (int j = 0; j < 3; j++) {
            RowModel *rowModel = [RowModel new];
            rowModel.name = [NSString stringWithFormat:@"第%d行", j];
            rowModel.detail = [NSString stringWithFormat:@"我是第%d行， 多多指教", j];
            [mutArr addObject:rowModel];
        }
        model.rowModelArr = mutArr;
        [self.listArr addObject:model];
    }
}

#pragma mark - change Cell Model
- (void)changeCellModelWithIndexPath:(NSIndexPath *)indexPath {
    
    //1、行不通
//    RowModel *newRowModel = [RowModel new];
//    newRowModel.name = @"新替换的name";
//    newRowModel.detail = @"新替换的detail";
//    
//    SectionModel *sModel = [SectionModel new];
//    sModel = [self.listArr objectAtIndex:indexPath.section];
//    NSArray *tempCellArr = sModel.rowModelArr;
//    RowModel *oldRowModel = [tempCellArr objectAtIndex:indexPath.row];
//    
//    oldRowModel = newRowModel;

    //2、相当于直接赋值
//    RowModel *newRM = [RowModel new];
//    newRM.name = @"新替换的name";
//    newRM.detail = @"新替换的detail";
//    
//    SectionModel *sModel = [SectionModel new];
//    sModel = [self.listArr objectAtIndex:indexPath.section];
//    NSArray *tempCellArr = sModel.rowModelArr;
//    RowModel *oldRM = [tempCellArr objectAtIndex:indexPath.row];
//    oldRM.name = newRM.name;
//    oldRM.detail = newRM.detail;
    
    //3、和第二种方法一样的道理
    RowModel *newRowModel = [RowModel new];
    newRowModel.name = @"新替换的name";
    newRowModel.detail = @"新替换的detail";
    
    SectionModel *sModel = [SectionModel new];
    sModel = [self.listArr objectAtIndex:indexPath.section];
    NSArray *tempCellArr = sModel.rowModelArr;
    self.oldRowModel = [tempCellArr objectAtIndex:indexPath.row];
//    self.oldRowModel = newRowModel;
    self.oldRowModel.name = newRowModel.name;
    self.oldRowModel.detail = newRowModel.detail;
    
    
    if (self.updateCellBlock) {
        self.updateCellBlock(indexPath);
    }
    
    
    
//    for (int i = 0; i < self.listArr.count; i++) {
//        SectionModel *sModel = [SectionModel new];
//        if (i == indexPath.section) {
//            sModel = [self.listArr objectAtIndex:i];
//            for (int j = 0; j < sModel.rowModelArr.count; j++) {
//                RowModel *rModel = [RowModel new];
//                if (j == indexPath.row) {
//                    rModel = [sModel.rowModelArr objectAtIndex:j];
//                    rModel.name = @"替换***";
//                    rModel.detail = @"我是被替换的新cell";
//                }
//            }
//        }
//    }
    
}

#pragma mark - get CellModel
- (RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath {
 
    SectionModel *secModel = [self.listArr objectAtIndex:indexPath.section];
    NSArray *rowArr = secModel.rowModelArr;
    RowModel *rModel = [rowArr objectAtIndex:indexPath.row];
    return rModel;
}

#pragma mark - cell/section Count
- (NSInteger)getSectionCount {
    return self.listArr.count;
}

- (NSInteger)getCellCountWithIndexPath:(NSInteger)section {
    SectionModel *secModel = [self.listArr objectAtIndex:section];
    return secModel.rowModelArr.count;
}

#pragma mark - get SectionModel
- (SectionModel *)getSectionModelWithSection:(NSInteger)section {
    SectionModel *sModel = [self.listArr objectAtIndex:section];
    return sModel;
}

@end
