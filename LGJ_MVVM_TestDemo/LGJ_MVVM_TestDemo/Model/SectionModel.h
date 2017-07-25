//
//  SectionModel.h
//  ChangeBlockInstanceTestDemo
//
//  Created by 劉光軍 on 2017/7/22.
//  Copyright © 2017年 劉光軍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic, copy) NSString *sectionName;
@property (nonatomic, strong) NSArray *rowModelArr;

@end
