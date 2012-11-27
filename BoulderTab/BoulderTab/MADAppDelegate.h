//
//  MADAppDelegate.h
//  BoulderTab
//
//  Created by Chris Giersch on 10/18/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *rootController;

@end
