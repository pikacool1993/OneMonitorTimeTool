//
//  MonitorTime.h
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MonitorTime : NSObject

+ (instancetype)shared;

- (void)startMonitor;
- (void)cancelMonitor;
- (void)logCallStack;

@end

@interface CallStackModel : NSObject

@property (nonatomic, copy) NSString *stackStr; // 完整的堆栈信息
@property (nonatomic, assign) NSTimeInterval dateString; // 可展示信息

@end

NS_ASSUME_NONNULL_END
