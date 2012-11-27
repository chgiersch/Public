//
//  MADViewController.m
//  GNAR1
//
//  Created by Chris Giersch on 9/23/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoadaqa
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updatePoints:(UISwitch *)sender {
    if (_firstliftSwitch.on){
        _gnarPoints.text=[_gnarPoints.text.intValue + sender.tag] ];
    }

}
@end
