//
//  XZLeftTableVIew.h
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZLeftTableView;

@protocol XZLeftTableViewdelegate <NSObject>

- (void)leftTableView:(XZLeftTableView *)leftTableView indexPathForRow:(NSInteger)row;

@end

@interface XZLeftTableView : UIView

// 外界传入的数据
@property(nonatomic,strong) NSArray *dataArr;

// 代理
@property(nonatomic,weak) id<XZLeftTableViewdelegate> delegate;

@end
