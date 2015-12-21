//
//  ViewController.m
//  CADisplayLINKdemo
//
//  Created by shancheli on 15/9/24.
//  Copyright © 2015年 shancheli. All rights reserved.
//

#import "ViewController.h"
#import "LFRound.h"

#import "CZCountDownView.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)CADisplayLink* displayLink;

@property(nonatomic,strong)LFRound *round;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self writeRound];
    
    [self creatDownCounter];
    
    
    UITableView* table = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, 475, 600) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}







-(void)writeRound
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    
    
    LFRound* round = [[LFRound alloc]init];
    round.frame = CGRectMake(0, 20, 150, 150);
    
    [self.view addSubview:round];
    self.round = round;
    round.radius = 20;
    round.toumingdu  = 0.1;
}

//由内向外
-(void)handleDisplayLink:(CADisplayLink *)displayLink
{
    self.round.radius += 0.4;
    self.round.toumingdu += 0.05;
    if (self.round.radius > 20) {
        self.round.radius = 0.5;
        self.round.toumingdu = 0.1;
    }
}

////由外向内
//-(void)handleDisplayLink:(CADisplayLink *)displayLink
//{
//    self.round.radius -= 0.2;
//    if (self.round.radius < 0.5) {
//        self.round.radius = 20;
//    }
//}




-(void)creatDownCounter
{
    // 封装后
    CZCountDownView *countDown = [CZCountDownView shareCountDown];
    countDown.frame = CGRectMake(150, 20, 200, 30);
    countDown.timestamp = 50;
    countDown.backgroundImageName = @"search_k";
    countDown.timerStopBlock = ^{
        NSLog(@"时间停止");
    };
    [self.view addSubview:countDown];
    
    CZCountDownView *c1 = [CZCountDownView countDown];
    CZCountDownView *c2 = [CZCountDownView countDown];
    NSLog(@"%p--%p",c1,c2);
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
