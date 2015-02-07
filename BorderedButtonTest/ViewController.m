//
//  ViewController.m
//  BorderedButtonTest
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "BorderedButton.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *enableSwitch;
@property (strong, nonatomic) IBOutlet UIButton *standardButton;
@property (strong, nonatomic) IBOutlet BorderedButton *customButton;

@end

@implementation ViewController

- (IBAction)toggle:(UISwitch *)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.standardButton.enabled = sender.isOn;
        self.customButton.enabled = sender.isOn;
    });
}
- (IBAction)showAlert:(UIButton *)sender {
    UIAlertController *ac = nil;
    UIAlertAction *defaultAction = nil;

    ac = [UIAlertController alertControllerWithTitle:@"Alert" message:nil preferredStyle:UIAlertControllerStyleAlert];

    defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];

    [ac addAction:defaultAction];
    [self presentViewController:ac animated:YES completion:nil];

}

@end
