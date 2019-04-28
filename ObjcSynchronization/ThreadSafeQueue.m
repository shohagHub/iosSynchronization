//
//  ThreadSafeQueue.m
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

/*
 *
 * Before synchronization what needed to do.sss
 */

#import "ThreadSafeQueue.h"

@implementation ThreadSafeQueue
//iVar
{
    NSMutableArray *_elements;
    NSLock *_lock;
}

-(instancetype)init{
    if(self = [super init]){
        _elements = [[NSMutableArray alloc]init];
        _lock = [[NSLock alloc]init];
    }
    return self;
}

-(void)push:(id)element {
    [_lock lock];
    [_elements addObject:element];
    [_lock unlock];
}

@end
