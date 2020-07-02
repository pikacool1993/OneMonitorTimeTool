//
//  ViewController.m
//  MonitorTimeTool
//
//  Created by a on 2020/6/23.
//  Copyright © 2020 a. All rights reserved.
//

#import "ViewController.h"
#import "MonitorTime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testAAAAAAAAAAA];
}

- (void)testAAAAAAAAAAA{
    [self testBBBBBBBBBB];
}

- (void)testBBBBBBBBBB{
    while (true) {
        sleep(3);
        break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[MonitorTime shared] logCallStack];
}


@end
