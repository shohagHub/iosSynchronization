//
//  ViewController.m
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//


//This blog has important informations about synchronization
//http://rykap.com/objective-c/2015/05/09/synchronized/
#import "ViewController.h"
#import "ThreadCall.h"
#import "Account.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[[Account alloc]init]saveBalance:100];
//    ThreadCall *threadCall = [[ThreadCall alloc]init];
//    [threadCall threadCall];
    
    Account *account = [[Account alloc]init];
    for(int i = 0; i < 20; i++){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [account withDrawSynchronized:10];
        });
    }
    
    NSLog(@"-----Synchronized call start----");
//    [account saveBalance:100];
//    for(int i = 0; i < 100; i++){
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//            [account withDrawWithoutSynchronized:10];
//        });
//    }
}

-(int)getRetainCount{
    NSDate *test = [NSDate date];
    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)test));
    return 0;
}


@end
