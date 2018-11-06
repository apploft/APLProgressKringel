//
//  ViewController.m
//  APLProgressKringel
//
//  Created by Nico Schümann on 02.05.17.
//  Copyright © 2017 apploft. All rights reserved.
//

#import "ViewController.h"
#import "APLProgressKringel.h"

@interface ViewController ()

@property (nonatomic) IBOutlet APLProgressKringelView *progressKringelView;
@property (nonatomic) NSUInteger progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    const CGFloat kringelWidth = 100;

    /*
     * Instantiate the ProgressKringel using its -instantiateFromXib method.
     */
    UIView *view = self.view;
    APLProgressKringelView *progressKringelView = [APLProgressKringelView instantiateFromXib];
    progressKringelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.progressKringelView = progressKringelView;
    [view addSubview:progressKringelView];
    
    /*
     * Set the ProgressKringel's constraints to position it in the superview.
     */
    [progressKringelView.centerXAnchor constraintEqualToAnchor:view.centerXAnchor].active = YES;
    [progressKringelView.centerYAnchor constraintEqualToAnchor:view.centerYAnchor].active = YES;
    [progressKringelView.heightAnchor  constraintEqualToConstant:kringelWidth    ].active = YES;
    [progressKringelView.widthAnchor   constraintEqualToConstant:kringelWidth    ].active = YES;
    
    /*
     * These are the customizations you may want to use.
     */
    progressKringelView.font        = [UIFont systemFontOfSize:24];
    progressKringelView.textColor   = [UIColor orangeColor];
    progressKringelView.circleColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    progressKringelView.strokeWidth = 8;
    
    /*
     * Just for demo purposes, increase the ProgressKringel's progress using a
     * timer.
     */
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                   selector:@selector(increaseProgress:)
                                   userInfo:nil
                                    repeats:YES];
     
}

- (void)increaseProgress:(id)sender {
    static const NSUInteger maximumValue = 100;
    
    /*
     * Yes, my intention was to make this a one-liner. If it was hard to write,
     * it should be hard to understand.
     */
    self.progressKringelView.progress = (self.progress++ % (maximumValue + 1)) * 1.0 / maximumValue;
}


@end
