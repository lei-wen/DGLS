//
//  DouglasPeuckerUtil.m
//  Douglas
//
//  Created by 蒋磊 on 2017/12/13.
//  Copyright © 2017年 蒋磊. All rights reserved.
//

#import "DouglasPeuckerUtil.h"
#import <math.h>
@implementation DouglasPeuckerUtil

- (NSMutableArray *)DouglasPeucker:(NSArray <DPoint *> *)pointList withEpsilon:(int)epsilon {
    
    double maxH = 0;
    int index = 0;
    
    //先找出最大值
    for (int i = 1; i < pointList.count - 1; i++) {
        double h = [self H:[pointList objectAtIndex:i] with:[pointList firstObject] with:[pointList lastObject]];
        if (h > maxH) {
            maxH = h;
            index = i;
        }
    }
    
    //如果存在最大阙值点，就递归遍历出所有最大阙值点
    NSMutableArray <DPoint *> *result = [NSMutableArray array];
    if (maxH > epsilon) {
        NSMutableArray <DPoint *> *LeftList = [NSMutableArray array];
        NSMutableArray <DPoint *> *RightList = [NSMutableArray array];
        //分别提取左右曲线的坐标点
        for (int i = 0; i < pointList.count; i++) {
            if (i <= index) {
                [LeftList addObject:[pointList objectAtIndex:i]];
                if (i == index) {
                    [RightList addObject:[pointList objectAtIndex:i]];
                }
            } else {
                [RightList addObject:[pointList objectAtIndex:i]];
            }
        }
        
        //分别保存两边遍历的结果
        NSMutableArray <DPoint *> *LeftResult = [NSMutableArray array];
        NSMutableArray <DPoint *> *RightResult = [NSMutableArray array];
        LeftResult = [self DouglasPeucker:LeftList withEpsilon:epsilon];
        RightResult = [self DouglasPeucker:RightList withEpsilon:epsilon];
        //整合两边的结果
        [RightResult removeObjectAtIndex:0];
        [LeftResult addObjectsFromArray:RightResult];
        result = LeftResult;
    } else {
        [result addObject:[pointList firstObject]];
        [result addObject:[pointList lastObject]];
    }
    return result;
}


/**
 * 海伦公式，已知三边就三角形面积
 */
- (double)helen:(double)CB with:(double)CA with:(double) AB {
    double p = (CB + CA + AB) / 2;
    double S = sqrt(p * (p-CB) * (p-CA) * (p-AB));
    return S;
}


/**
 * 计算两点之间的距离
 */
- (double)distance:(DPoint *)p1 with:(DPoint *)p2 {
    double x1 = p1.X;
    double y1 = p1.Y;
    
    double x2 = p2.X;
    double y2 = p2.Y;
    
    double xy = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    return xy;
}


/**
 * 计算点到直线的距离
 */
- (double)H:(DPoint *)p with:(DPoint *)s with:(DPoint *)e {
    double AB = [self distance:s with:e];
    double CB = [self distance:p with:s];
    double CA = [self distance:p with:e];
    
    double S = [self helen:CB with:CA with:AB];
    double H = 2 * S / AB;
    return H;
}


@end
