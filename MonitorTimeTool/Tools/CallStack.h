//
//  CallStack.h
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallLib.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CallStackType) {
    CallStackTypeAll,     //全部线程
    CallStackTypeMain,    //主线程
    CallStackTypeCurrent  //当前线程
};

@interface CallStack : NSObject

+ (NSString *)callStackWithType:(CallStackType)type;

extern NSString *stackOfThread(thread_t thread);

@end

NS_ASSUME_NONNULL_END
