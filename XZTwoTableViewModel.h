//
//  XZTwoTableViewModel.h
//  twoTabView
//
//  Created by WZZ on 15/11/24.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZTwoTableViewModel : NSObject

// 左边一个cell 右边就对应一个数组
@property(nonatomic,copy) NSString *leftCellString;

// 右边一个数组
@property(nonatomic,strong) NSArray *imageStringArr;
@end
