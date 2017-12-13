//
//  DPoint.m
//  Douglas
//
//  Created by 蒋磊 on 2017/12/13.
//  Copyright © 2017年 蒋磊. All rights reserved.
//

#import "DPoint.h"

@implementation DPoint

- (instancetype)initWithX:(double)X andY:(double)Y {
    self = [super init];
    if (self) {
        self.X = X;
        self.Y = Y;
    }
    return self;
}
@end
