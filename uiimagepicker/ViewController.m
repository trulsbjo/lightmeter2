//
//  ViewController.m
//  uiimagepicker
//
//  Created by Truls Hamborg on 03.03.14.
//  Copyright (c) 2014 Truls Hamborg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)takePicture:(id)sender {
    // First let's allocate memory for the UIImagePickerController and initalize it.
    // Since Xcode has moved to ARC (automatic reference counting),
    // we don't need to worry about deleting it later
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // Tell our picker object that this class (ViewController) will act as its delegate
    picker.delegate = self;
    // Allow for photo resizing
    picker.allowsEditing = YES;
    // Tell the picker we're going to be getting data from the phone's camera
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    // Now we want to launch the picker interface
    [self presentViewController:picker animated:YES completion:NULL];
}




// Once the user has picked their image
// picker is which picker called this function; only really useful if you have multiple pickers
// info is a dictionary object contains the original image taken, the resized image, and some other things
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Take the resized image out of the info dictionary
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    // Tell imageView that it's going to display that image
    self.imageView.image = chosenImage;
    // We're now done with our picker, so tell it to go away
    [picker dismissViewControllerAnimated:YES completion:NULL];

    
    
    NSDictionary *metadata = info[UIImagePickerControllerMediaMetadata];
    
    NSDictionary *exifMetadata = [metadata objectForKey:(id)kCGImagePropertyExifDictionary];
    
    //NSLog(@"%@", exifMetadata);
    
    NSString *shutter = [exifMetadata objectForKey: @"ExposureTime"];
    NSString *iso = [exifMetadata objectForKey: @"ISOSpeedRatings"];
    NSString *fnumber = [exifMetadata objectForKey: @"FNumber"];

    NSLog(@"%@", shutter);
    NSLog(@"%@", iso);
    NSLog(@"%@", fnumber);
    
}
// If the user hit cancel
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // All we really want to do is close the picker
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
