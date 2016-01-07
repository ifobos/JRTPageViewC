//
//  JRTPagedCollectionViewExample.m
//  JRTPageViewC
//
//  Created by Juan Garcia on 1/7/16.
//  Copyright © 2016 jerti. All rights reserved.
//

#import "JRTPagedCollectionViewExample.h"
#import "JRTPagedCollectionView.h"

@interface JRTPagedCollectionViewExample ()
@property (weak, nonatomic) IBOutlet JRTPagedCollectionView *pagedCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl          *pageControl;
@end

@implementation JRTPagedCollectionViewExample

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pagedCollectionView.pageControl    = self.pageControl;
    UIView *redView                         = [UIView new];
    redView.backgroundColor                 = [UIColor redColor];
    UIView *greenView                       = [UIView new];
    greenView.backgroundColor               = [UIColor greenColor];
    UIView *blueView                        = [UIView new];
    blueView.backgroundColor                = [UIColor blueColor];
    self.pagedCollectionView.views          = @[redView, greenView, blueView];
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
