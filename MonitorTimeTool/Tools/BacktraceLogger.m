//
//  CallStack.m
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import "CallStack.h"

// 为通用回溯设计结构支持栈地址由小到大，地址里存储上个栈指针的地址
typedef struct StackFrame {
    const struct StackFrame *const previous;
    const uintptr_t return_address;
} StackFrame;

@implementation CallStack

#pragma mark - Get Stack of mach_thread
NSString *starckOfThread(thread_t thread) {
    
    return @"";
}

@end
