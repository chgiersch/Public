//
//  MADViewController.h
//  GNAR1
//
//  Created by Chris Giersch on 9/23/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *firstliftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nakedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *aveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *buriedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *injurySwitch;

@end
