//
//  XZRigthView.m
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import "XZRigthView.h"
#import "XZTwoTableViewModel.h"
#import "XZCollectionViewCell.h"

#define kRightViewCollectionViewLayoutMargin 20
#define kRightViewCollectionViewCellWith 100
#define kRiggtViewCollectionViewCellIdentifier @"rightCollectionViewCell"
@interface XZRigthView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak) UICollectionView *collectionView;

@end

@implementation XZRigthView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubView];
        
        // 在这里注册可以吗
        [self.collectionView registerClass:[XZCollectionViewCell class] forCellWithReuseIdentifier:kRiggtViewCollectionViewCellIdentifier];
    }
    return self;
}


#pragma mark - 添加子控件
/**
 *  添加子控件
 */
- (void)setupSubView {
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:[self rightFlowlayout]];
    [self addSubview:collectionView];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
}

- (UICollectionViewFlowLayout *)rightFlowlayout {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = kRightViewCollectionViewLayoutMargin;
    layout.minimumLineSpacing = kRightViewCollectionViewLayoutMargin;
    layout.itemSize = CGSizeMake(kRightViewCollectionViewCellWith, kRightViewCollectionViewCellWith);
    layout.sectionInset = UIEdgeInsetsMake(kRightViewCollectionViewLayoutMargin, kRightViewCollectionViewLayoutMargin, 0, kRightViewCollectionViewLayoutMargin);
    return layout;
}

#pragma mark - collectionView数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XZCollectionViewCell *cell = [XZCollectionViewCell cellWithCollectionView:collectionView WithIndexpath:indexPath];
    cell.imageName = self.imageArr[indexPath.row];
    
    return cell;
}



#pragma mark - set & get

- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr ;
    [self.collectionView reloadData];
}
























@end
