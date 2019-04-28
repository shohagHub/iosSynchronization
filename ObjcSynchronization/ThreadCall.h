//
//  ThreadCall.h
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThreadCall : NSObject
-(void)threadCall:(int)value withValue: (int)anotherValue withOtherValue: (int)otherValue;
-(void)threadCall;

@end

NS_ASSUME_NONNULL_END
