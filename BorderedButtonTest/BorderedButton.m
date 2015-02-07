//
//  BorderedButton.m
//  BorderedButtonTest
//

#import "BorderedButton.h"

@interface BorderedButton ()

@property (assign, nonatomic) BOOL hairlineBorder;

@end

@implementation BorderedButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _bbUpdateLayer];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self _bbUpdateLayer];
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
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

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (borderWidth < 0.0) {
        CGFloat deviceScale = [[UIScreen mainScreen] scale];
        self.hairlineBorder = YES;

        if (deviceScale > 1.0) {
            self.layer.borderWidth = 1.0/deviceScale;
        } else {
            self.layer.borderWidth = 1.0;
        }
    } else {
        self.hairlineBorder = NO;
        self.layer.borderWidth = borderWidth;
    }
}

- (CGFloat)borderWidth {
    CGFloat retValue = 0.0;

    if (self.hairlineBorder ) {
        retValue = -1.0;
    } else {
        retValue = self.layer.borderWidth;
    }

    return retValue;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)_bbUpdateLayer {
    if (self.isEnabled == NO) {
        UIColor *disabledColor = [self titleColorForState:UIControlStateDisabled];

        self.layer.borderColor = disabledColor != nil ? [disabledColor CGColor] : [[self titleColorForState:UIControlStateNormal] CGColor];
    } else if (self.isHighlighted) {
        UIColor *highlightedColor = [self titleColorForState:UIControlStateHighlighted];

        if (self.buttonType == UIButtonTypeSystem) {
            self.layer.borderColor = highlightedColor != nil ? [[highlightedColor colorWithAlphaComponent:0.2] CGColor] : [[[self titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.2] CGColor];
        } else {
            self.layer.borderColor = highlightedColor != nil ? [highlightedColor CGColor] : [[self titleColorForState:UIControlStateNormal] CGColor];
        }
    } else {

        // Only system buttons animate the transition from UIControlStateHighlighted -> UIControlStateNormal
        if (self.buttonType == UIButtonTypeSystem) {
            static CGFloat const ButtonColorAnimationDuration = 0.215; // From UIButton.m (UIButtonColorAnimationDuration)
            CABasicAnimation *animation = [CABasicAnimation animation];

            animation.duration = ButtonColorAnimationDuration;
            [self.layer addAnimation:animation forKey:@"borderColor"];
        }

        self.layer.borderColor = [[self titleColorForState:UIControlStateNormal] CGColor];
    }
}

@end
