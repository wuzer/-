//
//  CycleViewModel.h
//  轮播
//
//  Created by Jefferson on 15/10/16.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleViewModel : NSObject
- (NSArray *)loadData;

+ (instancetype)sharedCycle;

@end
