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

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    bool isChanged;

}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;

@property (strong, nonatomic) NSArray *shutterValues;
@property (strong, nonatomic) NSArray *apertureValues;
@property (strong, nonatomic) NSArray *isoValues;

@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipeGestureRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipeGestureRecognizer;


@property (weak, nonatomic) IBOutlet UIPickerView *valuePicker;
@property (weak, nonatomic) IBOutlet UIButton *linkValues;
- (IBAction)changeLinkedValues:(id)sender;

@end
