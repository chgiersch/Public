//
//  MADSecondViewController.h
//  BoulderTab
//
//  Created by Chris Giersch on 10/18/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *secondWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *secondSpinner;

@end
