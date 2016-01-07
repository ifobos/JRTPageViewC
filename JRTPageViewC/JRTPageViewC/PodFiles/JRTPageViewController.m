//Copyright (c) 2015 Juan Carlos Garcia Alfaro. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


#import "JRTPageViewController.h"

@interface JRTPageViewController () <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic, readonly)UIView *pageContainer;
@end

@implementation JRTPageViewController

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
{
    self = [super init];
    if(self)
    {
        self.viewControllers = (NSMutableArray *)viewControllers;
    }
    return self;
}

#pragma mark - Getters

- (NSMutableArray *)viewControllers
{
    if (!_viewControllers || [_viewControllers count] == 0)
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, is empty. ", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    }
    return _viewControllers;
}

- (UIView *)pageContainer
{
    return self.view;
}


- (UIPageViewController *)pageController
{
    if (!_pageController)
    {
        _pageController            = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageController.dataSource = self;
    }
    return _pageController;
}

#pragma mark - View Controller


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self.pageController view] setFrame:[[self pageContainer] bounds]];
    [self.pageController setViewControllers:[NSArray arrayWithObject:[self.viewControllers firstObject]]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
    [self addChildViewController:self.pageController];
    
    
    [[self pageContainer] insertSubview:[self.pageController view] atIndex:0];
    [self.pageController didMoveToParentViewController:self];
    
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self.viewControllers indexOfObjectIdenticalTo:viewController];
    if (index == 0)
    {
        return nil;
    }
    index--;
    return [self.viewControllers objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self.viewControllers indexOfObjectIdenticalTo:viewController];
    index++;
    if (index >= [self.viewControllers count])
    {
        return nil;
    }
    return [self.viewControllers objectAtIndex:index];
}





@end
