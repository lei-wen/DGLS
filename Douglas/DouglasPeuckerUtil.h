//
//  DouglasPeuckerUtil.h
//  Douglas
//
//  Created by 蒋磊 on 2017/12/13.
//  Copyright © 2017年 蒋磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPoint.h"

@interface DouglasPeuckerUtil : NSObject
- (NSMutableArray *)DouglasPeucker:(NSArray <DPoint *> *)pointList withEpsilon:(int)epsilon;
@end
