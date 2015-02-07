//
//  BorderedButton.h
//  BorderedButtonTest
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BorderedButton : UIButton

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;



@end
