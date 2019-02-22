//
//  ViewController.m
//  CardRadius
//
//  Created by le tong on 2019/2/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+CardRadius.h"
#import "CardRadiusTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *CardRadiusTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.CardRadiusTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CardRadiusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cardRadiusCellIdentifier];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIRectCorner corner = UIRectCornerAllCorners;
    [cell insetCardViewWithCorners:corner
                        edgeInsets:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)
                            radius:5.f
                       borderWidth:1.f
                      borderCorlor:[UIColor orangeColor]
                   backgroundColor:[UIColor yellowColor]];
}
- (UITableView *)CardRadiusTableView{
    if (!_CardRadiusTableView) {
        _CardRadiusTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _CardRadiusTableView.delegate = self;
        _CardRadiusTableView.dataSource = self;
        _CardRadiusTableView.tableFooterView = [UIView new];
        [_CardRadiusTableView registerClass:[CardRadiusTableViewCell class] forCellReuseIdentifier:cardRadiusCellIdentifier];
        _CardRadiusTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _CardRadiusTableView;
}


@end
