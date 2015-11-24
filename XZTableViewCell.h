//
//  XZTableViewCell.h
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;


// 隐藏提示View
- (void)hidenTipView:(BOOL)ishiden;
@end
