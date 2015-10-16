//
//  CycleViewModel.m
//  轮播
//
//  Created by Jefferson on 15/10/16.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "CycleViewModel.h"

@implementation CycleViewModel

+ (instancetype)sharedCycle {
    
    static id instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSArray *)loadData {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i=0; i < 10; ++i) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:nil];
        [tempArray addObject:url];
    }

    return tempArray.copy;
}


@end
