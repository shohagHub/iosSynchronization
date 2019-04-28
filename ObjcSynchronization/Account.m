//
//  Account.m
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

#import "Account.h"

#define BALANCE_KEY @"BALANCE"
@implementation Account

-(BOOL)saveBalance:(int)amount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:amount forKey:BALANCE_KEY];
    return YES;
}

-(int)getBalance{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    int balance = 0;
    balance = (int)[userDefaults integerForKey:BALANCE_KEY];
    return balance;
}

-(void)checkUserDefault{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger integerValue = [defaults integerForKey:@"INVALID-KEY"];
    NSLog(@"%ld", (long)integerValue);
}

-(BOOL)withdraw:(int)amount{
    int balance = [self getBalance];
    BOOL status;
    int newBalance = balance;
    NSLog(@"balance is :%d", balance);
    if([self getBalance] >= amount){
        newBalance = balance - amount;
        [self saveBalance:newBalance];
        status = YES;
    }
    else {
        status = NO;
    }
    NSLog(@"status: %d New balance is:%d ", (status) ? 1 : 0, newBalance);
    return status;
}

/*
 * This method gurantee to not make the
 * balance negative(-)
 */
-(BOOL)withDrawSynchronized:(int)amount{
    @synchronized (self) {
        return [self withdraw:amount];
    }
}
/*
 *This method will/may make the balance negative(-)
 */
-(BOOL)withDrawWithoutSynchronized:(int)amount{
    return [self withdraw:amount];
}

@end
