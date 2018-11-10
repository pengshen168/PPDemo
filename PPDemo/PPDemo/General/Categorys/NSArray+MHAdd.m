//
//  NSArray+MHAdd.m
//  高仿MONO
//
//  Created by 万启鹏 on 2018/4/23.
//  Copyright © 2018年 万启鹏. All rights reserved.
//

#import "NSArray+MHAdd.h"

@implementation NSArray (MHAdd)
- (id)safeObjectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end
