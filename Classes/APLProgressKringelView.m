//
//  APLProgressKringelView.m
//
//  Created by Nico Schümann on 10.02.17.
//  Copyright © 2017 apploft. GmbH. All rights reserved.
//

#import "APLProgressKringelView.h"

@implementation APLProgressKringelView

+ (instancetype)instantiateFromXib {
    NSBundle *bundle = [NSBundle bundleForClass:self.classForCoder];
    return [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:bundle] instantiateWithOwner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.percentageLabel.textColor = self.textColor;
    self.percentageLabel.font = self.font;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.percentageLabel.textColor = textColor;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.percentageLabel.font = font;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (progress < 0) {
        progress = 0;
    } else if (progress > 1) {
        progress = 1;
    }
    
    NSUInteger percentage = progress * 100.;
    self.percentageLabel.text = [NSString stringWithFormat:@"%lu%%", (unsigned long)percentage];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat strokeWidth = self.strokeWidth;
    
    UIBezierPath* backgroundBezierPath = [UIBezierPath bezierPath];
    [backgroundBezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:(rect.size.width / 2) - strokeWidth / 2
                      startAngle:0
                        endAngle:2. * M_PI
                       clockwise:YES];
    backgroundBezierPath.lineWidth = strokeWidth;
    [self.circleColor setStroke];
    [backgroundBezierPath stroke];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    CGFloat startAngle = M_PI * 1.5;
    CGFloat endAngle = startAngle + _progress * 2 * M_PI;
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:(rect.size.width / 2) - strokeWidth / 2
                      startAngle:startAngle
                        endAngle:endAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = strokeWidth;
    [self.textColor setStroke];
    [bezierPath stroke];
}

@end
