//
//  BorderedButton.m
//  BorderedButtonTest
//
//  Created by Mike Laster on 2/6/15.
//
//

#import "BorderedButton.h"

@implementation BorderedButton

- (void)awakeFromNib {
    NSParameterAssert(self.buttonType == UIButtonTypeCustom);
    [super awakeFromNib];
    [self _bbUpdateLayer];
}

- (void)prepareForInterfaceBuilder {
    NSParameterAssert(self.buttonType == UIButtonTypeCustom);
    [super prepareForInterfaceBuilder];
    [self _bbUpdateLayer];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self _bbUpdateLayer];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self _bbUpdateLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}
- (void)_bbUpdateLayer {

    self.layer.borderWidth = self.borderWidth;
    self.layer.cornerRadius = self.cornerRadius;

    if (self.isEnabled == NO) {
        UIColor *disabledColor = [self titleColorForState:UIControlStateDisabled];

        self.layer.borderColor = disabledColor != nil ? [disabledColor CGColor] : [[self titleColorForState:UIControlStateNormal] CGColor];
    } else if (self.isHighlighted) {
        UIColor *highlightedColor = [self titleColorForState:UIControlStateHighlighted];

        self.layer.borderColor = highlightedColor != nil ? [highlightedColor CGColor] : [[self titleColorForState:UIControlStateNormal] CGColor];
    } else {
//        static CGFloat const UIButtonColorAnimationDuration = 0.215; // From UIButton.m
//
//        CABasicAnimation *animation = [CABasicAnimation animation];
//        animation.duration = UIButtonColorAnimationDuration;
//
//        [self.layer addAnimation:animation forKey:@"borderColor"];
        self.layer.borderColor = [[self titleColorForState:UIControlStateNormal] CGColor];
    }

}


@end
