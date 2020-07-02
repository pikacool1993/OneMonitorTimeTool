//
//  AppDelegate.m
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import "AppDelegate.h"
#import "MonitorTime.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MonitorTime.shared startMonitor];
    return YES;
}


@end
