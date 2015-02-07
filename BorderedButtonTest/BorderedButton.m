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
    [super awakeFromNib];
    [self _bbUpdateLayer];
}

- (void)prepareForInterfaceBuilder {
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

        self.layer.borderColor = disabledColor != nil ? [[disabledColor colorWithAlphaComponent:0.2] CGColor] : [[[self titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.2] CGColor];
        self.layer.borderColor = disabledColor != nil ? [[disabledColor colorWithAlphaComponent:0.2] CGColor] : [[[self titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.2] CGColor];
        self.titleLabel.textColor = [UIColor redColor];
        [self.titleLabel setNeedsDisplay];
    } else if (self.isHighlighted) {
        UIColor *highlightedColor = [self titleColorForState:UIControlStateHighlighted];

        self.layer.borderColor = highlightedColor != nil ? [[highlightedColor colorWithAlphaComponent:0.2] CGColor] : [[[self titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.2] CGColor];
    } else {
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.duration = 0.213;

        [self.layer addAnimation:animation forKey:@"borderColor"];
        self.layer.borderColor = [[self titleColorForState:UIControlStateNormal] CGColor];
    }

}


@end
