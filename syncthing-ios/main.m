//
//  main.m
//  syncthing-ios
//
//  Created by liangwei on 2016/12/8.
//  Copyright © 2016年 liangwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int iosmain(int argc, char * argv[]) {
    NSLog(@"iosmain ...");
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
