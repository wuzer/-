//
//  JFCollectionViewCell.m
//  轮播
//
//  Created by Jefferson on 15/10/16.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFCollectionViewCell.h"
#import "CycleViewModel.h"

@implementation JFCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self baseConfig];
    return self;
}



- (void)baseConfig {
    
    [self.contentView addSubview:self.iconView];
//    self.iconView.frame = self.contentView.bounds;
    self.iconView.translatesAutoresizingMaskIntoConstraints = false;

    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:nil views:@{@"image": self.iconView}]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:nil views:@{@"image": self.iconView}]];

}

- (void)setImageURL:(NSURL *)imageURL {
    
    _imageURL = imageURL;
    
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:data];    
    self.iconView.image = image;
}


#pragma mark - 懒加载

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

@end
