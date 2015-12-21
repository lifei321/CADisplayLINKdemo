//
//  LFRound.m
//  CADisplayLINKdemo
//
//  Created by shancheli on 15/9/24.
//  Copyright © 2015年 shancheli. All rights reserved.
//

#import "LFRound.h"

@implementation LFRound

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //参考线
    
    CGContextSetLineWidth(context, 1.0);//线的宽度
    
    CGContextSetRGBStrokeColor(context,1.0,0.184,0.184,_toumingdu);//画笔线的颜色

    
    CGContextAddArc(context, 100, 100, _radius, 0, M_PI*2, 1); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
}


-(void)setRadius:(CGFloat)radius
{
    _radius = radius;
    [self setNeedsDisplay];
}

@end
