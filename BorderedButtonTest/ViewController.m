//
//  ViewController.m
//  BorderedButtonTest
//
//

#import "ViewController.h"

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

@end
