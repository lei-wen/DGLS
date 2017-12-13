//
//  DPoint.h
//  Douglas
//
//  Created by 蒋磊 on 2017/12/13.
//  Copyright © 2017年 蒋磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPoint : NSObject

@property (nonatomic, assign) double X;
@property (nonatomic, assign) double Y;

- (instancetype)initWithX:(double)X andY:(double)Y;
@end
