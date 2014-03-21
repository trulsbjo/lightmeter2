//
//  ViewController.h
//  uiimagepicker
//
//  Created by Truls Hamborg on 03.03.14.
//  Copyright (c) 2014 Truls Hamborg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <ImageIO/CGImageDestination.h>
#import <opencv2/highgui/cap_ios.h>
#include <opencv2/legacy/compat.hpp>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    bool isLinked;
    
    bool shutterHasChanged;
    bool apertureHasChanged;
    bool isoHasChanged;
    
    bool linkedShutterHasChanged;
    bool linkedApertureHasChanged;
    bool linkedIsoHasChanged;
    
    bool histogramIsShown;

}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *takePictureButton;

@property (strong, nonatomic) NSArray *shutterValues;
@property (strong, nonatomic) NSArray *apertureValues;
@property (strong, nonatomic) NSArray *isoValues;

@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipeGestureRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipeGestureRecognizer;


@property (weak, nonatomic) IBOutlet UIPickerView *valuePicker;
@property (weak, nonatomic) IBOutlet UIButton *linkValues;
- (IBAction)changeLinkedValues:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *histogramButton;
- (IBAction)getHistogram:(id)sender;


@end
