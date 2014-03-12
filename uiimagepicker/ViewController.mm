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

int shutterPickerIndex;
int aperturePickerIndex;
int isoPickerIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //picker values
    _shutterValues = @[@"1/1000s", @"1/500s", @"1/250s", @"1/125s", @"1/60s", @"1/30s", @"1/15s", @"1/8s", @"1/4s", @"1/2s", @"1s"];
    
    _apertureValues = @[@"f/32", @"f/22", @"f/16", @"f/11", @"f/8", @"f/5.6", @"f/4", @"f/2.8", @"f/2", @"f/1.4", @"f/1.0"];
    
    _isoValues = @[@"50" ,@"100", @"200", @"400", @"800", @"1600", @"3200"];
    
    shutterPickerIndex = 0;
    aperturePickerIndex = 0;
    isoPickerIndex = 0;
    
    isChanged = false;
    
    apertureHasChanged = false;
    shutterHasChanged = false;
    isoHasChanged = false;
    
    
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

    
    

//    CGFloat brightness = 0.5;
//    UIImage *brighten = [self addBrightness:chosenImage :&brightness];
    
//    self.imageView.image = brighten;
   
    
    
    
//    CGFloat darkness = 0.5;
//    UIImage *darknen = [self addDarkness:chosenImage :&darkness];
//    
//    self.imageView.image = darknen;
    
    
    
    
    
    //getting metadata from taken image
    NSDictionary *metadata = info[UIImagePickerControllerMediaMetadata];
    
    NSDictionary *exifMetadata = [metadata objectForKey:(__bridge id)kCGImagePropertyExifDictionary];
    
    //NSLog(@"%@", exifMetadata);
    
    NSString *shutter = [exifMetadata objectForKey: @"ExposureTime"];
    NSArray *iso = [exifMetadata objectForKey: @"ISOSpeedRatings"];
    NSString *fnumber = [exifMetadata objectForKey: @"FNumber"];
    

    NSLog(@"shutter: %@", shutter);
    NSLog(@"iso: %@", iso);
    NSLog(@"aperture: %@", fnumber);
    
    //setting picker value for aperture
    
    double apertureValue = [fnumber doubleValue];
    
    if (apertureValue <= 32 && apertureValue >= 27) {
        [self.valuePicker selectRow:0 inComponent:1 animated:YES];
    }
    if (apertureValue < 27 && apertureValue >= 22) {
        [self.valuePicker selectRow:1 inComponent:1 animated:YES];
    }
    if (apertureValue <= 22 && apertureValue >= 19) {
        [self.valuePicker selectRow:1 inComponent:1 animated:YES];
    }
    if (apertureValue < 19 && apertureValue >= 16) {
        [self.valuePicker selectRow:2 inComponent:1 animated:YES];
    }
    if (apertureValue <= 16 && apertureValue >= 13.5) {
        [self.valuePicker selectRow:2 inComponent:1 animated:YES];
    }
    if (apertureValue < 13.5 && apertureValue >= 11) {
        [self.valuePicker selectRow:3 inComponent:1 animated:YES];
    }
    if (apertureValue < 11 && apertureValue >= 9.5) {
        [self.valuePicker selectRow:3 inComponent:1 animated:YES];
    }
    if (apertureValue < 9.5 && apertureValue >= 8) {
        [self.valuePicker selectRow:4 inComponent:1 animated:YES];
    }
    if (apertureValue < 8 && apertureValue >= 6.8) {
        [self.valuePicker selectRow:4 inComponent:1 animated:YES];
    }
    if (apertureValue < 6.8 && apertureValue >= 5.6) {
        [self.valuePicker selectRow:5 inComponent:1 animated:YES];
    }
    if (apertureValue < 5.6 && apertureValue >= 4.8) {
        [self.valuePicker selectRow:5 inComponent:1 animated:YES];
    }
    if (apertureValue < 4.8 && apertureValue >= 4) {
        [self.valuePicker selectRow:6 inComponent:1 animated:YES];
    }
    if (apertureValue < 4 && apertureValue >= 3.4) {
        [self.valuePicker selectRow:6 inComponent:1 animated:YES];
    }
    if (apertureValue < 3.4 && apertureValue >= 2.8) {
        [self.valuePicker selectRow:7 inComponent:1 animated:YES];
    }
    if (apertureValue < 2.8 && apertureValue >= 2.4) {
        [self.valuePicker selectRow:7 inComponent:1 animated:YES];
    }
    if (apertureValue < 2.4 && apertureValue >= 2) {
        [self.valuePicker selectRow:8 inComponent:1 animated:YES];
    }
    if (apertureValue < 2 && apertureValue >= 1.7) {
        [self.valuePicker selectRow:8 inComponent:1 animated:YES];
    }
    if (apertureValue < 1.7 && apertureValue >= 1.4) {
        [self.valuePicker selectRow:9 inComponent:1 animated:YES];
    }
    if (apertureValue < 1.4 && apertureValue >= 1.2) {
        [self.valuePicker selectRow:9 inComponent:1 animated:YES];
    }
    if (apertureValue < 1.2 && apertureValue >= 1.0) {
        [self.valuePicker selectRow:10 inComponent:1 animated:YES];
    }
    
    
    //setting picker value for shutter
    double shutterValue = [shutter doubleValue];
    
    if (shutterValue == (1/1000.0) && shutterValue <= (1/750.0)) {
        [self.valuePicker selectRow:0 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/750.0) && shutterValue <= (1/500.0)) {
        [self.valuePicker selectRow:1 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/500.0) && shutterValue <= (1/375.0)) {
        [self.valuePicker selectRow:1 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/375.0) && shutterValue <= (1/250.0)) {
        [self.valuePicker selectRow:2 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/250.0) && shutterValue <= (1/187.5)) {
        [self.valuePicker selectRow:2 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/187.5) && shutterValue <= (1/125.0)) {
        [self.valuePicker selectRow:3 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/125.0) && shutterValue <= (1/92.5)) {
        [self.valuePicker selectRow:3 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/92.5) && shutterValue <= (1/60.0)) {
        [self.valuePicker selectRow:4 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/60.0) && shutterValue <= (1/45.0)) {
        [self.valuePicker selectRow:4 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/45.0) && shutterValue <= (1/30.0)) {
        [self.valuePicker selectRow:5 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/30.0) && shutterValue <= (1/22.5)) {
        [self.valuePicker selectRow:5 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/22.5) && shutterValue <= (1/15.0)) {
        [self.valuePicker selectRow:6 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/15.0) && shutterValue <= (1/11.5)) {
        [self.valuePicker selectRow:6 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/11.5) && shutterValue <= (1/8.0)) {
        [self.valuePicker selectRow:7 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/8.0) && shutterValue <= (1/6.0)) {
        [self.valuePicker selectRow:7 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/6.0) && shutterValue <= (1/4.0)) {
        [self.valuePicker selectRow:8 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/4.0) && shutterValue <= (1/3.0)) {
        [self.valuePicker selectRow:8 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/3.0) && shutterValue <= (1/2.0)) {
        [self.valuePicker selectRow:9 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/2.0) && shutterValue <= (1/1.5)) {
        [self.valuePicker selectRow:9 inComponent:0 animated:YES];
    }
    if (shutterValue > (1/1.5) && shutterValue == (1/1)) {
        [self.valuePicker selectRow:10 inComponent:0 animated:YES];
    }
    
    
    //setting pickervalue for iso
    double isoValue = [[iso objectAtIndex:0] doubleValue];
    
    if (isoValue <= 50) {
        [self.valuePicker selectRow:0 inComponent:2 animated:YES];
    }
    if (isoValue > 50 && isoValue <= 100) {
        [self.valuePicker selectRow:1 inComponent:2 animated:YES];
    }
    if (isoValue > 100 && isoValue <=200) {
        [self.valuePicker selectRow:2 inComponent:2 animated:YES];
    }
    if (isoValue > 200 && isoValue < 300) {
        [self.valuePicker selectRow:2 inComponent:2 animated:YES];
    }
    if (isoValue >= 300 && isoValue <= 400) {
        [self.valuePicker selectRow:3 inComponent:2 animated:YES];
    }
    if (isoValue > 400 && isoValue < 600) {
        [self.valuePicker selectRow:3 inComponent:2 animated:YES];
    }
    if (isoValue >=600 && isoValue <= 800) {
        [self.valuePicker selectRow:4 inComponent:2 animated:YES];
    }
    if (isoValue > 800 && isoValue < 1200) {
        [self.valuePicker selectRow:4 inComponent:2 animated:YES];
    }
    if (isoValue >= 1200 && isoValue <= 1600) {
        [self.valuePicker selectRow:5 inComponent:2 animated:YES];
    }
    if (isoValue > 1600 && isoValue < 2400) {
        [self.valuePicker selectRow:5 inComponent:2 animated:YES];
    }
    if (isoValue >= 2400 && isoValue <= 3200) {
        [self.valuePicker selectRow:6 inComponent:2 animated:YES];
    }
    
     shutterPickerIndex = (int) [self.valuePicker selectedRowInComponent:0];
     aperturePickerIndex = (int) [self.valuePicker selectedRowInComponent:1];
     isoPickerIndex = (int) [self.valuePicker selectedRowInComponent:2];
    
    NSLog(@"%f", shutterValue);
    NSLog(@"%f", apertureValue);
    NSLog(@"%f", isoValue);
    
    
}



// If the user hit cancel
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // All we really want to do is close the picker
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//- (UIImage*) addBrightness: (UIImage*)image :(CGFloat*) brightness {
//    
//    UIGraphicsBeginImageContext(image.size);
//    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // Original image
//    [image drawInRect:imageRect];
//    
//    // Brightness overlay
//    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:*brightness].CGColor);
//    CGContextAddRect(context, imageRect);
//    CGContextFillPath(context);
//    
//    UIImage* resultBrightImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return resultBrightImage;
//}
//
//- (UIImage*) addDarkness: (UIImage*)image :(CGFloat*) darkness {
//    
//    UIGraphicsBeginImageContext(image.size);
//    CGRect imagedDarkRect = CGRectMake(0, 0, image.size.width, image.size.height);
//    CGContextRef darkContext = UIGraphicsGetCurrentContext();
//    
//    // Original image
//    [image drawInRect:imagedDarkRect];
//    
//    // Brightness overlay
//    CGContextSetFillColorWithColor(darkContext, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:*darkness].CGColor);
//    CGContextAddRect(darkContext, imagedDarkRect);
//    CGContextFillPath(darkContext);
//    
//    UIImage* resultDarkImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    
//    return resultDarkImage;
//}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(component==0){
        return _shutterValues.count;
    }
    else if(component==1){
        return _apertureValues.count;
    }
    else{
        return _isoValues.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [self.shutterValues objectAtIndex:row];
    }
    else if(component==1)
    {
        return [self.apertureValues objectAtIndex:row];
    }
    else
    {
        return [self.isoValues objectAtIndex:row];
    }
}

int globalDiff = 0;

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    
    if(component == 0) {
        if (isChanged==true) {
            
            int diff = (int) shutterPickerIndex - (int) row;
            aperturePickerIndex += diff;
            [pickerView selectRow:aperturePickerIndex inComponent:1 animated:YES];

        }
        else {
            if (!apertureHasChanged) {
                int diff = (int) shutterPickerIndex - (int) row;
                NSLog(@"diff : %d", diff);
                UIImage *image = self.imageView.image;
                
                cv::Mat img = [self cvMatFromUIImage:image];
                int beta =0;
                
                if (diff<0) {
                    cv::Mat brighter;
                    beta = diff*-1;
                    img.convertTo(brighter, -1, 1, 25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:brighter];
                    
                    globalDiff += diff;
                    
                }
                if (diff>0) {
                    cv::Mat darker;
                    beta = diff;
                    img.convertTo(darker, -1, 1, -25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:darker];
                    
                    globalDiff += diff;
                    
                }
                
                shutterHasChanged = true;
                
            }
            else {
                int diff = (int) shutterPickerIndex - (int) row;
                NSLog(@"diff : %d", diff);
                UIImage *image = self.imageView.image;
                
                cv::Mat img = [self cvMatFromUIImage:image];
                int beta = globalDiff;
                
                if (diff<0) {
                    cv::Mat brighter;
                    beta = diff*-1;
                    img.convertTo(brighter, -1, 1, 25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:brighter];
                    
                    globalDiff += diff;
                    
                }
                if (diff>0) {
                    cv::Mat darker;
                    beta = diff;
                    img.convertTo(darker, -1, 1, -25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:darker];
                    
                    globalDiff += diff;
                    
                }

            }
                        
        }
        
        shutterPickerIndex = (int) row;
        
        
    } else if (component == 1) {
        if (isChanged == true) {
            int diff = (int) aperturePickerIndex - (int) row;
            shutterPickerIndex += diff;
            [pickerView selectRow:shutterPickerIndex inComponent:0 animated:YES];
            
        }
        else {
            if (!shutterHasChanged) {
                int diff = (int) aperturePickerIndex - (int) row;
                NSLog(@"diff : %d", diff);
                UIImage *image = self.imageView.image;
            
                cv::Mat img = [self cvMatFromUIImage:image];
                int beta =0;
            
                if (diff<0) {
                    cv::Mat brighter;
                    beta = diff*-1;
                    img.convertTo(brighter, -1, 1, 25*beta);
                
                    _imageView.image = [self UIImageFromCVMat:brighter];
                    
                    globalDiff += diff;
                
                }
                if (diff>0) {
                    cv::Mat darker;
                    beta = diff;
                    img.convertTo(darker, -1, 1, -25*beta);
                
                    _imageView.image = [self UIImageFromCVMat:darker];
                    
                    globalDiff += diff;
                }
                
                apertureHasChanged = true;
           
                
            }
            else {
                int diff = (int) aperturePickerIndex - (int) row;
                NSLog(@"diff : %d", diff);
                UIImage *image = self.imageView.image;
                
                cv::Mat img = [self cvMatFromUIImage:image];
                int beta = globalDiff;
                
                if (diff<0) {
                    cv::Mat brighter;
                    beta = diff*-1;
                    img.convertTo(brighter, -1, 1, 25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:brighter];
                    
                    globalDiff += diff;
                    
                }
                if (diff>0) {
                    cv::Mat darker;
                    beta = diff;
                    img.convertTo(darker, -1, 1, -25*beta);
                    
                    _imageView.image = [self UIImageFromCVMat:darker];
                    
                    globalDiff += diff;
                }

            }
            
    
        }
        aperturePickerIndex = (int) row;
                
    } else {
        if (!isoHasChanged) {
            int diff = (int) isoPickerIndex - (int) row;
            NSLog(@"diff : %d", diff);
            UIImage *image = self.imageView.image;
            
            cv::Mat img = [self cvMatFromUIImage:image];
            int beta =0;
            
            if (diff<0) {
                cv::Mat brighter;
                beta = diff*-1;
                img.convertTo(brighter, -1, 1, 25*beta);
                
                _imageView.image = [self UIImageFromCVMat:brighter];
                
                globalDiff += diff;
                
            }
            if (diff>0) {
                cv::Mat darker;
                beta = diff;
                img.convertTo(darker, -1, 1, -25*beta);
                
                _imageView.image = [self UIImageFromCVMat:darker];
                
                globalDiff += diff;
            }
            
            isoHasChanged = true;
        }
        else {
            int diff = (int) isoPickerIndex - (int) row;
            NSLog(@"diff : %d", diff);
            UIImage *image = self.imageView.image;
            
            cv::Mat img = [self cvMatFromUIImage:image];
            int beta = globalDiff;
            
            if (diff<0) {
                cv::Mat brighter;
                beta = diff*-1;
                img.convertTo(brighter, -1, 1, 25*beta);
                
                _imageView.image = [self UIImageFromCVMat:brighter];
                
                globalDiff += diff;
                
            }
            if (diff>0) {
                cv::Mat darker;
                beta = diff;
                img.convertTo(darker, -1, 1, -25*beta);
                
                _imageView.image = [self UIImageFromCVMat:darker];
                
                globalDiff += diff;
            }
            
        }
        
        isoPickerIndex = (int) row;
    }
    
    NSLog(@"globalDiff : %d", globalDiff);
    
}

- (IBAction)changeLinkedValues:(id)sender {
    isChanged = !isChanged;
    if (isChanged==true) {
        _linkValues.tintColor = [UIColor lightGrayColor];
        [_linkValues setTitle:@"Unlik values" forState:UIControlStateNormal];
    }
    else {
        _linkValues.tintColor = [UIColor blueColor];
        [_linkValues setTitle:@"Link values" forState:UIControlStateNormal];
    }
    
    
}

#ifdef __cplusplus

- (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
}

-(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    CGColorSpaceRef colorSpace;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
                                        cvMat.rows,                                 //height
                                        8,                                          //bits per component
                                        8 * cvMat.elemSize(),                       //bits per pixel
                                        cvMat.step[0],                            //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );
    
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return finalImage;
}

#endif

@end
