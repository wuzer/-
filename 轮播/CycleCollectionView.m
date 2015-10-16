//
//  CycleCollectionView.m
//  轮播
//
//  Created by Jefferson on 15/10/16.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "CycleCollectionView.h"
#import "JFCollectionViewCell.h"
#import "CycleViewModel.h"

@interface CycleCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowlayout;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSArray *imageUrls;

@end

static NSString *reuserID = @"cell";
@implementation CycleCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    [self registerClass:[JFCollectionViewCell class] forCellWithReuseIdentifier:reuserID];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.flowlayout = layout;
    self.dataSource = self;
    self.delegate = self;
    
    [self baseConfig];
    return [super initWithFrame:frame collectionViewLayout:layout];
}

- (void)baseConfig {
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.flowlayout.itemSize = CGSizeMake(size.width, size.height);
    self.flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowlayout.minimumInteritemSpacing = 0;
    self.flowlayout.minimumLineSpacing = 0;
    
    self.pagingEnabled = YES;
    
    self.contentOffset = CGPointMake(self.frame.size.width, 0);
    self.currentIndex = 0;
}

#pragma mark - datasource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSArray *array = [[CycleViewModel sharedCycle] loadData];
    self.imageUrls = array;
//    NSLog(@"%@",self.imageUrls);
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuserID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    
    
    NSArray *imageUrls = [[CycleViewModel sharedCycle] loadData];
    NSInteger index = (indexPath.item - 1 + imageUrls.count + self.currentIndex) % imageUrls.count;
    cell.imageURL = imageUrls[index];
//    NSLog(@"%@",imageUrls);
    return cell;
}

#pragma mark - delegate 

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    NSInteger count = self.imageUrls.count;
    NSLog(@"%zd",offset);
    
    // 如果页面没有变化，直接返回
    if (offset == 0) {
        return;
    }
    
    // 计算 currentIndex
    self.currentIndex = (self.currentIndex + offset + count) % count;
    
    // 滚动到 item
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [scrollView setContentOffset:CGPointMake(scrollView.bounds.size.width, 0) animated:NO];
    });
    

}

@end
