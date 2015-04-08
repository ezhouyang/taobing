//
//  TaoBingTabBarController.h
//  taobing
//
//  Created by yang.zy on 15-4-1.
//  Copyright (c) 2015年 taobing. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TaoBingRootViewController : UITabBarController

@property (nonatomic, strong) UIView *tabBarView;
@property (nonatomic, strong) NSArray *tabBarImgArray;
@property (nonatomic, strong) NSMutableArray *tabBarBtnArray;

@end
