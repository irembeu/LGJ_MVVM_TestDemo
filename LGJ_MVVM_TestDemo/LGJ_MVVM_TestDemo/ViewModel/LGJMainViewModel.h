//
//  LGJMainViewModel.h
//  ChangeBlockInstanceTestDemo
//
//  Created by 劉光軍 on 2017/7/22.
//  Copyright © 2017年 劉光軍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SectionModel.h"
#import "RowModel.h"

typedef void(^UpdateCellBlock)(NSIndexPath *indexPath);

@interface LGJMainViewModel : NSObject

@property (nonatomic, copy) UpdateCellBlock updateCellBlock;

- (void)changeCellModelWithIndexPath:(NSIndexPath *)indexPath;
- (RowModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)getCellCountWithIndexPath:(NSInteger)section;
- (NSInteger)getSectionCount;
- (SectionModel *)getSectionModelWithSection:(NSInteger)section;

@end
