//
//  ViewController.m
//  Douglas
//
//  Created by 蒋磊 on 2017/12/13.
//  Copyright © 2017年 蒋磊. All rights reserved.
//

#import "ViewController.h"
#import "DouglasPeuckerUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSMutableArray <DPoint *> *points = [NSMutableArray array];
    NSMutableArray <DPoint *> *result = [NSMutableArray array];
    
    DPoint *point1 = [[DPoint alloc] initWithX:1 andY:1];
    DPoint *point2 = [[DPoint alloc] initWithX:2 andY:2];
    DPoint *point3 = [[DPoint alloc] initWithX:3 andY:4];
    DPoint *point4 = [[DPoint alloc] initWithX:4 andY:1];
    DPoint *point5 = [[DPoint alloc] initWithX:5 andY:0];
    DPoint *point6 = [[DPoint alloc] initWithX:6 andY:3];
    DPoint *point7 = [[DPoint alloc] initWithX:7 andY:5];
    DPoint *point8 = [[DPoint alloc] initWithX:8 andY:2];
    DPoint *point9 = [[DPoint alloc] initWithX:9 andY:1];
    DPoint *point10 = [[DPoint alloc] initWithX:10 andY:6];
    
    [points addObject:point1];
    [points addObject:point2];
    [points addObject:point3];
    [points addObject:point4];
    [points addObject:point5];
    [points addObject:point6];
    [points addObject:point7];
    [points addObject:point8];
    [points addObject:point9];
    [points addObject:point10];
    
    result = [[DouglasPeuckerUtil alloc] DouglasPeucker:points withEpsilon:1];
    
    
    for (int i = 0; i < result.count; i++) {
        NSLog(@"%f, %f", [[result objectAtIndex:i] X], [[result objectAtIndex:i] Y]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
