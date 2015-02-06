//
//  BorderedButton.h
//  BorderedButtonTest
//
//  Created by Mike Laster on 2/6/15.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIButton (Designable)

@end

IB_DESIGNABLE
@interface BorderedButton : UIButton

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;



@end
