//
//  ViewController.m
//  TNCustomSegment
//
//  Created by TigerNong on 16/12/25.
//  Copyright © 2016年 TigerNong. All rights reserved.
//

#import "ViewController.h"
#import "TNCustomSegment.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TNCustomSegmentDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *items = @[@"第一",@"第二",@"第三"];
    
    TNCustomSegment *segment = [[TNCustomSegment alloc] initWithItems:items withFrame:CGRectMake(10, 30, [UIScreen mainScreen].bounds.size.width - 20, 40) withSelectedColor:nil withNormolColor:nil withFont:nil];
    segment.delegate = self;
    segment.selectedIndex = 1;
    [self.view addSubview:segment];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(segment.frame) + 5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(segment.frame) + 5);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.selectIndex == 0) {
        return 5;
    }else if (self.selectIndex == 1){
        return 10;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld_____%ld",self.selectIndex,indexPath.row];
    
    return cell;
}

#pragma mark - TNCustomsegmentDelegate
- (void)segment:(TNCustomSegment *)segment didSelectedIndex:(NSInteger)selectIndex{
    
    self.selectIndex = selectIndex;
    
    [self.tableView reloadData];
    
}


@end
