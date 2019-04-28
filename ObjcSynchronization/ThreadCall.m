//
//  ThreadCall.m
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

#import "ThreadCall.h"
#import "Account.h"


@implementation ThreadCall

-(void)threadCall{
     Account *account = [[Account alloc]init];
    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [account withdraw:10];
        });
    }
    
}

-(void)threadCall:(int)value withValue:(int)anotherValue withOtherValue:(int)otherValue{
    NSLog(@"Something");
}

-(void)withdrawBalance{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        Account *account = [[Account alloc]init];
        [account withdraw:10];
    });
}
@end
