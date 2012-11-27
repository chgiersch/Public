//
//  MADViewController.h
//  Media1
//
//  Created by Chris Giersch on 11/27/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileCoreServices/MobileCoreServices.h"
#import "MediaPlayer/MediaPlayer.h"

@interface MADViewController : UIViewController <
	UIImagePickerControllerDelegate,
	UINavigationControllerDelegate,
	UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender;

@end
