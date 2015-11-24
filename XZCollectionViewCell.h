//
//  XZCollectionViewCell.h
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZCollectionViewCell : UICollectionViewCell

/**
 *  图片的名称
 */
@property(nonatomic,copy) NSString *imageName;


+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView WithIndexpath:(NSIndexPath *)indexPath;

@end
