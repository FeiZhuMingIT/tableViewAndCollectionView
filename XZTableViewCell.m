//
//  XZTableViewCell.m
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import "XZTableViewCell.h"
#define kLeftTableViewCellIdentifier @"leftCell"
#define kLeftTableViewCellHeight 60
#define kLeftTableViewTipViewWidth 3
@interface XZTableViewCell()

@property(nonatomic,weak) UIView *tipView;

@end

@implementation XZTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    XZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLeftTableViewCellIdentifier];
    if (!cell) {
        cell = [[XZTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kLeftTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *tipView = [[UIView alloc] init];
        [self addSubview:tipView];
        tipView.backgroundColor = [UIColor blueColor];
        self.tipView = tipView;
        tipView.hidden = YES;
    }
    return self;
}

#pragma mark - 自动布局x
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tipView.frame = CGRectMake(0, 0, kLeftTableViewTipViewWidth, kLeftTableViewCellHeight);
}

#pragma mark - set & get
- (void)hidenTipView:(BOOL)ishiden {
    
    self.tipView.hidden = ishiden;
}
@end
