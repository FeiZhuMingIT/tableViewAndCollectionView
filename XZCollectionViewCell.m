//
//  XZCollectionViewCell.m
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import "XZCollectionViewCell.h"
#define kRiggtViewCollectionViewCellIdentifier @"rightCollectionViewCell"

@interface XZCollectionViewCell()

@property(nonatomic,weak) UIImageView *imageView;

@property(nonatomic,weak) UIView *tipView;
@end

@implementation XZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
    }
    return self;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexpath:(NSIndexPath *)indexPath {
    
    XZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRiggtViewCollectionViewCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

// 加一个子控件
- (void)setupSubView {

    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

/**
 *  自动布局
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.frame = self.bounds;

}
@end
