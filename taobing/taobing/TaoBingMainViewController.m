//
//  TaoBingMainController.m
//  taobing
//
//  Created by yang.zy on 15-4-1.
//  Copyright (c) 2015年 taobing. All rights reserved.
//

#import "TaoBingMainViewController.h"

@implementation TaoBingMainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 创建信息表格视图
    self.infoTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.infoTableView.delegate = self;
    self.infoTableView.dataSource = self;
    self.infoTableView.backgroundColor = [UIColor clearColor];
    self.infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.infoTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.infoTableView];

}

#pragma mark -- info table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CCBBillDetailViewCell";
    CCBBillDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (!cell) {
        cell = [[CCBBillDetailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
    }
}

@end
