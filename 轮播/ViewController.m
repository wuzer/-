//
//  ViewController.m
//  轮播
//
//  Created by Jefferson on 15/10/16.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "ViewController.h"
#import "CycleCollectionView.h"
#import "CycleViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CycleCollectionView *cycle = [[CycleCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    cycle.showsHorizontalScrollIndicator = false;
    [self.view addSubview:cycle];
    
}

- (void)loasData {
        

}


@end
