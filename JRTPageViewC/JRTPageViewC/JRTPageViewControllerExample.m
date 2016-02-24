//
//  JRTPageViewControllerExample.m
//  JRTPageViewC
//
//  Created by Juan Garcia on 1/7/16.
//  Copyright © 2016 jerti. All rights reserved.
//

#import "JRTPageViewControllerExample.h"

@interface JRTPageViewControllerExample ()

@end

@implementation JRTPageViewControllerExample

@synthesize viewControllers = _viewControllers;

- (NSMutableArray *)viewControllers {
    if (!_viewControllers) {
        UIViewController *redViewController = [UIViewController new];
        redViewController.view.backgroundColor = [UIColor redColor];
        UIViewController *greenViewController = [UIViewController new];
        greenViewController.view.backgroundColor = [UIColor greenColor];
        UIViewController *blueViewController = [UIViewController new];
        blueViewController.view.backgroundColor = [UIColor blueColor];
        
        _viewControllers = [NSMutableArray new];
        [_viewControllers addObjectsFromArray:@[redViewController, greenViewController, blueViewController]];
    }
    return _viewControllers;
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
