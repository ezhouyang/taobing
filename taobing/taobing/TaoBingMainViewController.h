//
//  TaoBingMainController.h
//  taobing
//
//  Created by yang.zy on 15-4-1.
//  Copyright (c) 2015年 taobing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaoBingMainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

// 信息表格视图，包括：插入的广告、发布的需求信息
@property (strong, nonatomic) UITableView *infoTableView;

@end
