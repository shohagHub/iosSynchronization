//
//  Account.h
//  ObjcSynchronization
//
//  Created by Saleh Enam Shohag on 27/4/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject
-(BOOL)withdraw:(int)amount;
-(BOOL)saveBalance:(int)amount;
-(BOOL)withDrawWithoutSynchronized:(int)amount;
-(BOOL)withDrawSynchronized:(int)amount;
@end

NS_ASSUME_NONNULL_END
