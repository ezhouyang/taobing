//
//  TaoBingTabBarController.m
//  taobing
//
//  Created by yang.zy on 15-4-1.
//  Copyright (c) 2015年 taobing. All rights reserved.
//

#import "TaoBingRootViewController.h"
#import "TaoBingMeViewController.h"
#import "TaoBingMainViewController.h"
#import "TaoBingDiscoverViewController.h"
#import "TaoBingPhotoViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
// iPhone 6  之前是49， 现在是96
CGFloat const tabViewHeight = 49;
// tab bar button width and height
CGFloat const btnWidth = 32;
CGFloat const btnHeight = 32;


@implementation TaoBingRootViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    [self initViewControllers];
    [self initTabBarView];
    
}

- (void)initViewControllers
{
    TaoBingMainViewController *mainVC = [[TaoBingMainViewController alloc] init];
    TaoBingDiscoverViewController *discoverVC = [[TaoBingDiscoverViewController alloc] init];
    TaoBingPhotoViewController *photoVC = [[TaoBingPhotoViewController alloc] init];
    TaoBingMeViewController *meVC = [[TaoBingMeViewController alloc] init];
  
    NSArray *vcArray = @[mainVC,discoverVC,photoVC,meVC];
    
    NSMutableArray *tabArray = [[NSMutableArray alloc] initWithCapacity:vcArray.count];
    for (int i=0; i<vcArray.count; i++) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vcArray[i]];
        [tabArray addObject:navCtrl];
    }
    
    self.viewControllers = tabArray;
    
}

- (void)initTabBarView
{
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - tabViewHeight), kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarView];
    
    _tabBarImgArray = @[@"gift",@"idea",@"photo",@"me"];
    _tabBarBtnArray = [[NSMutableArray alloc] initWithCapacity:_tabBarImgArray.count];
    CGFloat tabBarWidth = (kScreenWidth/4);
    CGFloat btnXPoint =  (tabBarWidth-btnWidth)/2;
    
    for(int i =0; i<_tabBarImgArray.count;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:_tabBarImgArray[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * (kScreenWidth/4) + btnXPoint, (tabViewHeight - btnHeight)/2, btnWidth, btnHeight);
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:btn];
        [_tabBarBtnArray addObject:btn];
       
    }
    
    // 初始化gift默认被选中
    [[_tabBarBtnArray objectAtIndex:0] setBackgroundImage:[UIImage imageNamed:[_tabBarImgArray[0] stringByAppendingString:@"_filled"] ] forState:UIControlStateNormal];
}

- (void)btnAction:(UIButton *)button
{
    self.selectedIndex = button.tag - 100;
    [self changeTabBarImg:self.selectedIndex];
}

- (void)changeTabBarImg:(NSUInteger)selectedIndex
{
 
    for(int i =0; i<_tabBarImgArray.count;i++){
        UIButton *btn = [_tabBarBtnArray objectAtIndex:i];
        [UIView animateWithDuration:0.2 animations:^{
            if (i == selectedIndex) {
                [btn setBackgroundImage:[UIImage imageNamed:[_tabBarImgArray[i] stringByAppendingString:@"_filled"] ] forState:UIControlStateNormal];
            } else {
                [btn setBackgroundImage:[UIImage imageNamed:_tabBarImgArray[i] ] forState:UIControlStateNormal];
            }
        }];
        
    }
}


@end
