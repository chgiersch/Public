//
//  MADViewController.m
//  Media1
//
//  Created by Chris Giersch on 11/27/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController (){
	UIImage *image;
	NSURL *videoURL;
}

@end

@implementation MADViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender {
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	if (image || videoURL)
	{
		[actionSheet addButtonWithTitle:@"Save"];
	}
	[actionSheet addButtonWithTitle:@"Camera Roll"];
	[actionSheet addButtonWithTitle:@"Cancel"];
	
	actionSheet.cancelButtonIndex = actionSheet.numberOfButtons -1;
	
	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
	if ([buttonTitle isEqualToString:@"Save"])
	{
		if (image)
		{
			UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
		}
	}
	else if (videoURL)
	{
		NSString *urlString = [videoURL path];
		if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlString))
		{
			UISaveVideoAtPathToSavedPhotosAlbum(urlString, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
		}
	}
	else if ([buttonTitle isEqualToString:@"Camera Roll"])
	{
		UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
		imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
		imagePickerController.allowsEditing = NO;
		imagePickerController.delegate = self;
		[self presentModalViewController:imagePickerController animated:YES];
	}
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	if (error)
	{
		NSLog(@"Error! %@", [error localizedDescription]);
	}
	else
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Image saved"
															message:@"Image saved successfully to camera roll."
														   delegate:nil
												  cancelButtonTitle:nil
												  otherButtonTitles:@"OK", nil];
		[alertView show];
	}
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	if (error)
	{
		NSLog(@"Error! %@", [error localizedDescription]);
	}
	else
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Video saved"
															message:@"Video saved successfully to camera roll."
														   delegate:nil
												  cancelButtonTitle:nil
												  otherButtonTitles:@"OK", nil];
		[alertView show];
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	//NSLog(@"imagePickerController method accessed");
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	
	image = nil;
	imageView.image = nil;
	videoURL = nil;
	
	if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) //picture
	{
		UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
		UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
		image = editedImage ? editedImage : originalImage; // shortcut ifElse statement - is(true): editedImage, else:originalImage
		imageView.image = image;
	}
	else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
	{
		videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
	}
	
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
		imagePickerController.delegate = self;
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
		imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage, (NSString *)kUTTypeMovie, nil];
		[self presentModalViewController:imagePickerController animated:YES];
	}
	else{
		NSLog(@"Can't access the camera");
	}
}
@end
