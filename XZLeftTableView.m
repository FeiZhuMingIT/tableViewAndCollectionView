//
//  XZLeftTableVIew.m
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import "XZLeftTableView.h"
#import "XZTwoTableViewModel.h"
#import "XZTableViewCell.h"
#define kLeftTableViewCellIdentifier @"leftCell"
#define kLeftTableViewCellHeight 60
#define kLeftTableViewTipViewWidth 3
@interface XZLeftTableView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@property(nonatomic,weak) UIView *tipView;

// 记录上一次的cell
@property(nonatomic,weak) XZTableViewCell *preCell;
@end

@implementation XZLeftTableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView {
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:tableView];
    self.tableView = tableView;
    
    // 加一个提示条
    UIView *tipView = [[UIView alloc] init];
    [self addSubview:tipView];
    tipView.backgroundColor = [UIColor blueColor];
    self.tipView = tipView;
    
    //选中的是第一个cell最开始 不需要可能
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:1];
    self.preCell = [self.tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - tableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 这里就不把cell抽出来了。
    XZTableViewCell *cell = [XZTableViewCell cellWithTableView:tableView];
    cell.textLabel.text = [self.dataArr[indexPath.row] leftCellString];
    return cell;
}

#pragma mark - tableViewDelegate的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 固定cell的高度是60
    // 这里应该有一个代理告诉控制器你点击了哪一个cell。
    return kLeftTableViewCellHeight;
}

// tableViewCell被点击了
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([self.delegate respondsToSelector:@selector(leftTableView:indexPathForRow:)]) {
        [self.delegate leftTableView:self indexPathForRow:indexPath.row];
    }

    
    // 隐藏上一个cell
    [self.preCell hidenTipView:YES];
    // 拿到当前点击的cell相对于tableView的frame值
    XZTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect tipFrame = [cell.superview convertRect:cell.frame toCoordinateSpace:self];
    NSLog(@"%@",NSStringFromCGRect(tipFrame));
    self.tipView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.tipView.frame = CGRectMake(0, tipFrame.origin.y, kLeftTableViewTipViewWidth ,kLeftTableViewCellHeight);
    } completion:^(BOOL finished) {
        self.tipView.hidden = YES;
        
        // 告诉cell的tipView不要隐藏了
        self.preCell = cell;
        [cell hidenTipView:NO];
    }];

    
}


#pragma mark - 自动布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
    
    self.tipView.frame = CGRectMake(0, 0, kLeftTableViewTipViewWidth, kLeftTableViewCellHeight);
    
}

#pragma mark - set & get
// 加载数据
- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    [self.tableView reloadData];
}






@end
