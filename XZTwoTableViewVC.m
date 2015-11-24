//
//  XZTwoTableViewVC.m
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import "XZTwoTableViewVC.h"
#import "XZLeftTableView.h"
#import "XZRigthView.h"
#import "XZTwoTableViewModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kleftTableViewWith 100
@interface XZTwoTableViewVC () <XZLeftTableViewdelegate>

@property(nonatomic,weak) XZLeftTableView *leftTableView;

// 模拟数据
@property(nonatomic,strong) NSMutableArray *leftTableViewDataArr;

// 右边view
@property(nonatomic,weak) XZRigthView *rightView;

// 右边view数据
@property(nonatomic,strong) NSMutableArray *rightViewDataArr;

// 数据
@property(nonatomic,strong) NSMutableArray *modelArr;
@end

@implementation XZTwoTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景是白色
    self.view.backgroundColor = [UIColor whiteColor];
    // 添加左边按钮
    [self setupLeftTableView];
    
    // 模拟左边veiw加载数据过程
    [self leftTableViewAddData];
    
    // 添加右边collectionView
    [self setupRightTableView];
    
    // 模拟右边view加载过程
     [self rightViewAddDataWithRow:0];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 添加子控件
/**
 *  添加左边的tableView
 */
- (void)setupLeftTableView {
    
    XZLeftTableView *leftTableView = [[XZLeftTableView alloc] initWithFrame:CGRectMake(0, 0, kleftTableViewWith, kScreenHeight)];
    leftTableView.delegate = self;
    [self.view addSubview:leftTableView];
    self.leftTableView = leftTableView;

}

- (void)setupRightTableView {
    
    XZRigthView *rightView = [[XZRigthView alloc] initWithFrame:CGRectMake(kleftTableViewWith, 0, kScreenWidth - kleftTableViewWith, kScreenHeight)];
    [self.view addSubview:rightView];
    self.rightView = rightView;
}

#pragma mark - leftTableView的代理方法
- (void)leftTableView:(XZLeftTableView *)leftTableView indexPathForRow:(NSInteger)row {
    [self rightViewAddDataWithRow:row];
}

#pragma mark - 模拟的加载数据过程
- (void)leftTableViewAddData {
    
    self.leftTableView.dataArr = self.modelArr;
}

- (void)rightViewAddDataWithRow:(NSInteger)row {
    
    // 先加载第一行数据
    self.rightView.imageArr = [self.modelArr[row] imageStringArr];
}


#pragma mark - set & get
/**
 *  虚拟数据
    左边一个cell 对应右边一组cell的数据
 */

- (NSMutableArray *)modelArr {
    
    if (_modelArr == nil) {
        
        _modelArr = [NSMutableArray array];
        // 模拟15条数据
        for (NSInteger index = 0; index < 15; index ++) {
            XZTwoTableViewModel *model = [[XZTwoTableViewModel alloc] init];
            model.leftCellString = [NSString stringWithFormat:@"第 %ld 项",index];
            
            // 每个model加载随机张图片。最大值15最小1
            NSMutableArray *imageArr = [NSMutableArray array];
            NSInteger count = arc4random_uniform(15) + 1;
            for (NSInteger imageIndex = 0; imageIndex < count; imageIndex ++) {
                [imageArr addObject:[NSString stringWithFormat:@"face_%ld",index + 1]];
            }
            model.imageStringArr = imageArr;
            
            [_modelArr addObject:model];
            NSLog(@"%@",_modelArr);
        }
    }
    return _modelArr;
}


@end
