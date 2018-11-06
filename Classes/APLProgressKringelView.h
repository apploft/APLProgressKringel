//
//  APLProgressKringelView.h
//
//  Created by Nico Schümann on 10.02.17.
//  Copyright © 2017 apploft. GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APLProgressKringelView : UIView

@property (nonatomic) CGFloat progress;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIColor *circleColor;
@property (nonatomic) CGFloat strokeWidth;
@property (nonatomic) UIFont *font;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

+ (instancetype)instantiateFromXib;

@end
