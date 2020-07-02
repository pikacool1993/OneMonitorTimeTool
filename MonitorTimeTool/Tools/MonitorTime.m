//
//  MonitorTime.m
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import "MonitorTime.h"
#import "CallStack.h"

@interface MonitorTime ()

@property (nonatomic, strong) dispatch_source_t monitoringTimer;
@property (nonatomic, strong) NSMutableDictionary *callStackDict;

@end

@implementation MonitorTime

+ (instancetype)shared {
    static MonitorTime *time = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        time = [[self alloc] init];
    });
    return time;
}

- (void)startMonitor {
    self.callStackDict = [NSMutableDictionary dictionary];
    // 创建一个 timer 类型定时器
    self.monitoringTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    // 设置定时器的各种属性（何时开始，间隔多久执行）
    // GCD 的时间参数一般为纳秒 （1 秒 = 10 的 9 次方 纳秒）
    // 指定定时器开始的时间和间隔的时间s
    dispatch_source_set_timer(self.monitoringTimer, dispatch_walltime(NULL, 0), 0.01 * NSEC_PER_SEC, 0);
    // 任务回调
    dispatch_source_set_event_handler(self.monitoringTimer, ^{
        NSString *callStackString = [CallStack callStackWithType:CallStackTypeMain];
        CallStackModel *stackModel = [self.callStackDict objectForKey:callStackString];
        if (stackModel == nil) {
            stackModel = [[CallStackModel alloc] init];
            stackModel.stackStr = callStackString;
            stackModel.dateString = 0.01;
            [self.callStackDict setObject:stackModel forKey:callStackString];
        } else {
            stackModel.dateString += 0.01;
        }
    });
    dispatch_resume(self.monitoringTimer);
}

- (void)cancelMonitor {
    dispatch_source_cancel(self.monitoringTimer);
}

- (void)logCallStack {
    NSMutableString * resultString = [NSMutableString stringWithFormat:@""];
    for (NSString *key in self.callStackDict.allKeys) {
        CallStackModel *model = [self.callStackDict objectForKey:key];
        if (model.stackStr && model.dateString > 0.01) {
            [resultString appendFormat:@"%@ 耗时：%0.2f \n", model.stackStr, model.dateString];
        }
    }
}

@end

@implementation CallStackModel

@end
